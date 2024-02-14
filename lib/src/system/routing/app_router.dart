import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/features/authentification/presentation/account/account_screen.dart';
import 'package:hsm/src/features/cards/presentation/card_of_the_day/card_of_the_day_screen.dart';
import 'package:hsm/src/features/cards/presentation/card_view/card_view_screen.dart';
import 'package:hsm/src/features/cards/presentation/cards_grid/cards_grid_screen.dart';
import 'package:hsm/src/features/cards/presentation/cards_home/cards_home_screen.dart';
import 'package:hsm/src/features/cards/presentation/cards_swiper/cards_swiper_screen.dart';
import 'package:hsm/src/features/cards/presentation/random_card/random_card_screen.dart';
import 'package:hsm/src/features/home/presentation/home_screen.dart';
import 'package:hsm/src/features/manifestations/presentation/manifestations_screen.dart';
import 'package:hsm/src/features/meditations/presentation/meditations_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum AppRoutes {
  home,
  cards,
  randomCard,
  cardOfTheDay,
  cardsGallery,
  cardsGalleryCardDetails,
  cardsSwiper,
  cardsSwiperCardDetails,
  meditations,
  manifestations,
  account,
  notifications,
  signIn,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: HomeScreen(child: child));
        },
        routes: [
          GoRoute(
            path: '/',
            name: AppRoutes.cards.name,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Scaffold(
                  body: CardsHomeScreen(),
                ),
              );
            },
            routes: [
              GoRoute(
                path: 'card-of-the-day',
                name: AppRoutes.cardOfTheDay.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const CardOfTheDayScreen(),
              ),
              GoRoute(
                path: 'random-card',
                name: AppRoutes.randomCard.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const RandomCardScreen(),
              ),
              GoRoute(
                path: 'cards-swiper',
                name: AppRoutes.cardsSwiper.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const CardsSwiperScreen(),
                routes: [
                  GoRoute(
                    path: 'card/:id',
                    name: AppRoutes.cardsSwiperCardDetails.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final cardId = state.pathParameters['id']!;
                      return CardViewScreen(cardId: cardId);
                    },
                  ),
                ]
              ),
              GoRoute(
                path: 'cards-gallery',
                name: AppRoutes.cardsGallery.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const CardsGridScreen(),
                routes: [
                  GoRoute(
                    path: 'card/:id',
                    name: AppRoutes.cardsGalleryCardDetails.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) {
                      final cardId = state.pathParameters['id']!;
                      return CardViewScreen(cardId: cardId);
                    },
                  ),
                ])
            ]
          ),
          GoRoute(
            path: '/meditations',
            name: AppRoutes.meditations.name,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Scaffold(
                  body: MeditationsScreen(),
                ),
              );
            },
          ),
          GoRoute(
            path: '/manifestations',
            name: AppRoutes.manifestations.name,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Scaffold(
                  body: ManifestationsScreen(),
                ),
              );
            }
          ),
        ],
      ),
      GoRoute(
        path: '/account',
        name: AppRoutes.account.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AccountScreen(),
      ),
    ],
  );
}