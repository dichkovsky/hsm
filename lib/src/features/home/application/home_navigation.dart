import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';
import 'package:hsm/src/system/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_navigation.g.dart';

@riverpod
class HomePageSelectedTabIndex extends _$HomePageSelectedTabIndex {
  @override
  int build() {
    return 0;
  }

  updateIndex(value) {
    state = value;
  }
}

class HomePageNav {
  final Ref ref;

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
      )
    ];
  }

  HomePageNav(this.ref);

  void setCurrent(int current) {
    ref.read(homePageSelectedTabIndexProvider.notifier).updateIndex(current);
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
