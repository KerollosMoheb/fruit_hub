import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('Bloc: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Bloc: ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Bloc: ${bloc.runtimeType}, Error: $error');
  }
}