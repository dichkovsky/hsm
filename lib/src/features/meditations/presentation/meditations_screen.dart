import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/common_widgets/error_message_widget.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/common_widgets/ui_card.dart';
import 'package:flutter/material.dart';
import 'package:hsm/src/features/meditations/application/meditations_service.dart';
import 'package:hsm/src/system/localization/app_locale_provider.dart';

class MeditationsScreen extends ConsumerWidget {
  const MeditationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(appLocaleStrProvider);

    final meditationsListValue = ref.watch(meditationsListFutureProvider(lang));

    final error = meditationsListValue.error;
    if (error != null) {
      return Center(child: ErrorMessageWidget(error.toString()));
    }
    // * The previous value will be returned while loading
    final meditations = meditationsListValue.value;
    // * As a result, we only show the loading indicator if the value is null
    if (meditations == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        children: [
          for (var item in meditations) UICard(
            height: Sizes.p104, 
            title: item.title,
            subTitle: item.subTitle,
            onTap: () => context.pushNamed('name'),
          )
        ]
      ),
    );
  }
}