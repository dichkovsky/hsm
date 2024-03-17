import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/exceptions/app_exception.dart';
import 'package:hsm/src/system/exceptions/error_logger.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/meditations/domain/meditation_player_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditation_service.g.dart';

@Riverpod(keepAlive: true)
MeditationService meditationService(MeditationServiceRef ref) {
  return MeditationService(ref, AudioPlayer());
}

class MeditationService extends BaseAudioHandler {
  final Ref ref;
  final AudioPlayer _player;

  ErrorLogger? _logger;

  StreamSubscription<PlayerState?>? _playerStateSub;
  StreamSubscription<Duration?>? _playerDurationSub;
  StreamSubscription<Duration?>? _playerPositionSub;

  MeditationService(this.ref, this._player) {
    _logger = ref.read(errorLoggerProvider);

    _playerStateSub = _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        pause();
        seek(Duration.zero);
      } else {
        ref.read(playerStateNotifierProvider.notifier).copyWith(playing: state.playing);
      }
    });

    _playerDurationSub = _player.durationStream.listen((duration) {
      ref.read(playerStateNotifierProvider.notifier).copyWith(total: duration);
    });

    _playerPositionSub = _player.positionStream.listen((duration) {
      ref.read(playerStateNotifierProvider.notifier).copyWith(progress: duration);
    });
  }

  @override
  Future<void> play() async {
    _player.play();
    playbackState.add(playbackState.value.copyWith(
      playing: true,
      controls: [MediaControl.pause],
    ));
  }
  @override
  Future<void> pause() async {
    _player.pause();
    playbackState.add(playbackState.value.copyWith(
      playing: false,
      controls: [MediaControl.play],
    ));
  }

  @override
  Future<void> stop() async {
    _pauseSubs();
    await _player.stop();
    ref.read(playerStateNotifierProvider.notifier).copyWith(playing: false, progress: Duration.zero, total: Duration.zero);
    playbackState.add(playbackState.value.copyWith(
      processingState: AudioProcessingState.idle,
    ));
  }

  @override
  Future<void> seek(Duration position) async {
    _player.seek(position);
    playbackState.add(playbackState.value.copyWith(
      updatePosition: position
    ));
  }

  void playPause() {
    _player.playing ? pause() : play();
  }

  Future<void> setSource(Meditation meditation, String album) async {
    try {
      var item = MediaItem(
        id: meditation.audioURL,
        album: album,
        title: meditation.title,
        artUri: Uri.parse(meditation.coverURL),
        duration: Duration(seconds: meditation.duration),
      );
      mediaItem.add(item);
      final duration = await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(meditation.audioURL),
          tag: item,
        )
      );
      _resumeSubs();
      playbackState.add(playbackState.value.copyWith(
        playing: false,
        controls: [MediaControl.play],
        processingState: AudioProcessingState.ready,
      ));
      ref.read(playerStateNotifierProvider.notifier).copyWith(total: duration);
      playbackState.add(playbackState.value.copyWith(
        updatePosition: Duration.zero
      ));
    } on PlayerException catch (e) {
      _logger?.logAppException(MeditationPlayerException("PlayerException. Error code: ${e.code}. Error message: ${e.message}."));
    } on PlayerInterruptedException catch (e) {
      _logger?.logAppException(MeditationPlayerException("PlayerInterruptedException. Error message: ${e.message}."));
    } catch (e) {
      _logger?.logAppException(MeditationPlayerException("${e.runtimeType}. Error message: ${e.toString()}."));
    }
  }

  void seekRelative(int secs) async {
    _player.seek(Duration(seconds: _player.position.inSeconds + secs));
  }

  void _resumeSubs() {
    _playerStateSub?.resume();
    _playerDurationSub?.resume();
    _playerPositionSub?.resume();
  }

  void _pauseSubs() {
    _playerStateSub?.pause();
    _playerDurationSub?.pause();
    _playerPositionSub?.pause();
  }
}

@Riverpod(keepAlive: true)
class PlayerStateNotifier extends _$PlayerStateNotifier {
  
  @override
  MeditationPlayerState build() {
    return const MeditationPlayerState();
  }

  void copyWith({
    bool? playing,
    Duration? progress,
    Duration? total,
  }) {
    state = state.copyWith(playing: playing, progress: progress, total: total);
  }

}