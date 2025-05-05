import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  final bool enableLogging;

  AppBlocObserver({this.enableLogging = true});

  void _log(String emoji, String label, BlocBase bloc, [Object? details]) {
    if (!kDebugMode || !enableLogging) return;
    final timestamp = DateTime.now().toIso8601String();
    final blocType = bloc.runtimeType;
    final detailString = details != null ? ', $details' : '';
    print('$emoji [$timestamp] [$label] Bloc: $blocType$detailString');
  }

  @override
  void onCreate(BlocBase bloc) {
    _log('🔵', 'onCreate', bloc);
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    _log('🔴', 'onClose', bloc);
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _log('🟡', 'onChange', bloc, 'Change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _log('❌', 'onError', bloc, 'Error: $error\nStackTrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _log('🟢', 'onEvent', bloc, 'Event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _log('🔁', 'onTransition', bloc, 'Transition: $transition');
    super.onTransition(bloc, transition);
  }
}
