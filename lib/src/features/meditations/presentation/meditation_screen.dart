import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/features/meditations/application/meditation_service.dart';
import 'package:hsm/src/features/meditations/application/meditations_service.dart';
import 'package:hsm/src/features/meditations/domain/meditation.dart';
import 'package:hsm/src/features/meditations/presentation/meditation_player_widget.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class MeditationScreen extends ConsumerWidget {

  final MeditationID meditationId;

  const MeditationScreen({required this.meditationId, super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meditationFuture = ref.watch(meditationFutureProvider(meditationId));

    return meditationFuture.when(
      skipLoadingOnReload: true,
      data: (Meditation? meditation) => getMeditationScreen(meditation!, context, ref), 
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString()))
    );
  }
  
  Widget getMeditationScreen(Meditation meditation, BuildContext context, WidgetRef ref) {
    ref.read(meditationServiceProvider).setSource(meditation, context.loc.appTitle);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        ref.read(meditationServiceProvider).stop();
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(meditation.title),
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
                        ConstrainedBox(constraints: const BoxConstraints(minHeight: 200), child: MeditationPlayer (meditation))
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Expanded(child: getBodyPart(meditation, context, ref)),
                        const SizedBox(height: Sizes.p20, width: Sizes.p20,),
                        Expanded( child: MeditationPlayer (meditation))
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
}