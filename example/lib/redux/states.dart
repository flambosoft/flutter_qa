import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'states.g.dart';

abstract class MatchingState
    implements Built<MatchingState, MatchingStateBuilder> {
  String get title;

  BuiltList<String> get sources;

  BuiltList<String> get destinations;

  BuiltMap<int, int> get connections;

  MatchingState._();

  factory MatchingState([void Function(MatchingStateBuilder) updates]) =
      _$MatchingState;
}

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<MatchingState> get matchingStates;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}