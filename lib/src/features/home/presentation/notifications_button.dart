import 'package:hsm/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/system/routing/app_router.dart';

class NotificationsButton extends ConsumerWidget {
  const NotificationsButton({super.key});

  // * Keys for testing using find.byKey()
  static const notificationsIconKey = Key('notifications-icon');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final notificationsCount = ref.watch(notificationsCountProvider);
    const notificationsCount = 0;
    return Stack(
      children: [
        Center(
          child: IconButton(
            key: notificationsIconKey,
            icon: const Icon(Icons.notifications),
            onPressed: () => context.pushNamed(AppRoutes.notifications.name),
          ),
        ),
        if (notificationsCount > 0)
          const Positioned(
            top: Sizes.p8,
            right: Sizes.p8,
            child: Badge(
              label: Text("$notificationsCount"),
            )
          ),
      ],
    );
  }
}