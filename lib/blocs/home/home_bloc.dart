import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/authentication.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _auth;

  HomeBloc(this._auth) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginEvent>((event, emit) async {
      final user = await _auth.authenticateUser(event.username, event.password);
      if (user != null) {
        emit(SuccessfulLoginState(user));
      }
    });
  }
}
