import 'package:go_router/go_router.dart';
import 'package:hsm/src/constants/brakepoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';

class HomeAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: import needed providers
    //final user = ref.watch(authStateChangesProvider).value;
    //final isAdminUser = ref.watch(isCurrentUserAdminProvider).value ?? false;
    
    // * This widget is responsive.
    // * On large screen sizes, it shows all the actions in the app bar.
    // * On small screen sizes, it shows only the shopping cart icon and a
    // * [MoreMenuButton].
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      return AppBar(
        title: Text(context.loc.appTitle),
        actions: [
          //const NotificationsButton(),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.pushNamed(AppRoutes.account.name),
          )
        ],
      );
    } else {
      return AppBar(
        title: Text(context.loc.appTitle),
        actions: [
          //const NotificationsButton(),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => context.pushNamed(AppRoutes.account.name),
          )
          /* if (user != null) ...[
            ActionTextButton(
              key: MoreMenuButton.ordersKey,
              text: 'Orders'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.orders.name),
            ),
            ActionTextButton(
              key: MoreMenuButton.accountKey,
              text: 'Account'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.account.name),
            ),
          ] else
            ActionTextButton(
              key: MoreMenuButton.signInKey,
              text: 'Sign In'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.signIn.name),
            ),
          if (isAdminUser)
            ActionTextButton(
              key: MoreMenuButton.adminKey,
              text: 'Admin'.hardcoded,
              onPressed: () => context.pushNamed(AppRoute.admin.name),
            ), */
        ],
      );
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

}