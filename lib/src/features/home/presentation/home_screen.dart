import 'package:hsm/src/features/home/presentation/main_app_bar.dart';
import 'package:hsm/src/features/home/application/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageNav = ref.read(homePageNavProvider);
    final tabs = homePageNav.getNavigation(context);
    return OrientationBuilder(builder: (context, orientation) 
      {
        if (orientation == Orientation.portrait) {
          return Scaffold(
            appBar: const HomeAppBar(),
            body: SafeArea(child: child),
            bottomNavigationBar: NavigationBar(
              indicatorColor: Theme.of(context).colorScheme.primaryContainer,
              selectedIndex: ref.watch(homePageSelectedTabIndexProvider),
              onDestinationSelected: (int index) {
                String location = tabs[index].initialLocation;
                ref.read(homePageSelectedTabIndexProvider.notifier).updateIndex(index);
                context.goNamed(location);
              },
              destinations: tabs
            ) ,
          );
        } else {
          return Scaffold(
            appBar: const HomeAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: child
            ),
          );
        }
      },
    );
  }
}