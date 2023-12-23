import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_navigation.g.dart';

class HomePageNav {
  final Ref ref;

  int currentIndex = 0;

  List<MyCustomNavBarItem> getNavigation(BuildContext context) {
    return [
      MyCustomNavBarItem(
        selectedIcon: const Icon(Icons.auto_awesome_motion),
        icon: const Icon(Icons.auto_awesome_motion_outlined),
        label: context.loc.cards,
        tooltip : context.loc.cards,
        initialLocation: AppRoutes.cards.name,
      ),
      MyCustomNavBarItem(
        selectedIcon: const Icon(Icons.auto_awesome_rounded),
        icon: const Icon(Icons.auto_awesome_outlined),
        label: context.loc.meditations,
        tooltip : context.loc.meditations,
        initialLocation: AppRoutes.meditations.name,
      ),
      MyCustomNavBarItem(
        selectedIcon: const Icon(Icons.auto_fix_high_rounded),
        icon: const Icon(Icons.auto_fix_high_outlined),
        label: context.loc.manifestations,
        tooltip : context.loc.manifestations,
        initialLocation: AppRoutes.manifestations.name,
      )
    ];
  }

  HomePageNav(this.ref);

  void setCurrent(int current) {
    currentIndex = current;
  }
}

@riverpod
HomePageNav homePageNav(HomePageNavRef ref) {
  return HomePageNav(ref);
}

class MyCustomNavBarItem extends NavigationDestination {
  final String initialLocation;

  const MyCustomNavBarItem(
      {super.key,
      required this.initialLocation,
      required super.icon,
      super.selectedIcon,
      super.tooltip,
      String? label})
      : super(
            label: label ?? 'Empty');
}
