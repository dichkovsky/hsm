import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/meditations/application/meditation_service.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class MeditationPlayer extends ConsumerWidget {

  final Meditation? meditation;

  const MeditationPlayer(this.meditation, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerStateNotifierProvider);
    if (meditation == null || playerState.total.inSeconds == 0) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: playerState.progress.inSeconds >= 5 ? () => ref.read(meditationServiceProvider).seekRelative(-5) : null,
                child: Column(
                  children: [
                    const Icon(Icons.undo),
                    Text(context.loc.seekBack)
                  ]
                ),
              ),
              const Spacer(),
              IconButton.filled(
                iconSize: Sizes.p64,
                tooltip: playerState.playing ? context.loc.pause : context.loc.play,
                icon: Icon(playerState.playing ? Icons.pause : Icons.play_arrow),
                onPressed: () => ref.read(meditationServiceProvider).playPause(),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: ((playerState.total.inSeconds - playerState.progress.inSeconds) >= 5) ? () => ref.read(meditationServiceProvider).seekRelative(5) : null,
                child: Column(
                  children: [
                    const Icon(Icons.redo),
                    Text(context.loc.seekForward),
                  ]
                ),
              ),
            ],
          ),
          ProgressBar(
            progress: playerState.progress,
            total: playerState.total,
            onSeek: (duration) => ref.read(meditationServiceProvider).seek(duration),
          ),
        ],
      );
    }
  }
}