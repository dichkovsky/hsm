import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/features/meditations/domain/meditation_player_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditation_service.g.dart';

@Riverpod(keepAlive: true)
MeditationService meditationService(MeditationServiceRef ref) {
  return MeditationService(ref, AudioPlayer(playerId: "meditationPlayer"));
}

class MeditationService {
  final Ref ref;
  final AudioPlayer _player;

  MeditationService(this.ref, this._player) {

    _player.onPlayerStateChanged.listen((PlayerState event) {
      switch (_player.state) {
        case PlayerState.playing:
          ref.read(playerStateNotifierProvider.notifier).copyWith(playing: true);
          break;
        case PlayerState.stopped:
        case PlayerState.disposed:
          ref.read(playerStateNotifierProvider.notifier).copyWith(playing: false, total: Duration.zero, progress: Duration.zero);
          break;
        default:
          ref.read(playerStateNotifierProvider.notifier).copyWith(playing: false);
      }
    });

    _player.onDurationChanged.listen((event) {
      ref.read(playerStateNotifierProvider.notifier).copyWith(total: Duration(seconds: event.inSeconds));
    });

    _player.onPositionChanged.listen((event) {
      ref.read(playerStateNotifierProvider.notifier).copyWith(progress: Duration(seconds: event.inSeconds));
    });

    _player.onLog.listen((event) {
      debugPrint("Player log - ${event.toString()}");
    });
  }

  void playPause(source) {
    _player.state == PlayerState.playing ? _player.pause() : _player.play(source);
  }

  void setSource(source) {
    _player.setSource(source);
  }

  void stop() {
    _player.stop();
  }

  void seek(int secs) async {
    final pos = await _player.getCurrentPosition();
    _player.seek(Duration(seconds: pos!.inSeconds + secs));
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