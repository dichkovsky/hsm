import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/meditations/application/meditation_service.dart';
import 'package:hsm/src/features/meditations/application/meditations_service.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/system/extensions.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class MeditationScreen extends ConsumerWidget {

  final MeditationID meditationId;

  const MeditationScreen({required this.meditationId, super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meditationFuture = ref.watch(meditationFutureProvider(meditationId));

    return meditationFuture.when(
      data: (Meditation? meditation) => getMeditationScreen(meditation!.title, meditation, context, ref), 
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString()))
    );
  }
  
  Widget getMeditationScreen(String title, Meditation meditation, BuildContext context, WidgetRef ref) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          ref.read(meditationServiceProvider).stop();
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p20),
              child: Center(
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    if (orientation == Orientation.portrait) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getBodyPart(meditation, context, ref),
                          const SizedBox(height: Sizes.p20, width: Sizes.p20,),
                          ConstrainedBox(constraints: const BoxConstraints(minHeight: 150), child: getPlayerPart(meditation, context, ref))
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          Expanded(child: getBodyPart(meditation, context, ref)),
                          const SizedBox(height: Sizes.p20, width: Sizes.p20,),
                          Expanded(child: getPlayerPart(meditation, context, ref))
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget getBodyPart(Meditation meditation, BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Scrollbar(
        child: ListView(
            children: [
              Text(meditation.subTitle),
              Text(meditation.description)
            ],
          ),
      ),
    );
  }

  Widget getPlayerPart(Meditation meditation, BuildContext context, WidgetRef ref) {
    ref.read(meditationServiceProvider).setSource(UrlSource(meditation.audioURL));
    final playerState = ref.watch(playerStateNotifierProvider);
    if (playerState.total.inSeconds == 0) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: playerState.progress.inSeconds >= 5 ? () => ref.read(meditationServiceProvider).seek(-5) : null,
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
                icon: Icon(playerState.playing ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  ref.read(meditationServiceProvider).playPause(UrlSource(meditation.audioURL));
                },
              ),
              const Spacer(),
              OutlinedButton(
                child: Column(
                  children: [
                    const Icon(Icons.redo),
                    Text(context.loc.seekForward),
                  ]
                ),
                onPressed: () {
                  ref.read(meditationServiceProvider).seek(5);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(playerState.progress.format()),
              Text(playerState.total.format()),
            ],
          ),
          LinearProgressIndicator(
            backgroundColor: Theme.of(context).highlightColor,
            value: playerState.progress.inSeconds / playerState.total.inSeconds,
          ),
        ],
      );
    }
  }
}