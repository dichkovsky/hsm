import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_service.g.dart';

@riverpod
class IsPremiun extends _$IsPremiun {
  
  //TODO: get this from real account
  @override
  bool build() {
    return false;
  }
}