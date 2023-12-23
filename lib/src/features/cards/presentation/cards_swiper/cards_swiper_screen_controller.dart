import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_swiper_screen_controller.g.dart';

@riverpod
class CardsSwiperScreenController extends _$CardsSwiperScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }
}

final swiperIndexStateProvider = StateProvider<int>((ref) {
  return 0;
});
