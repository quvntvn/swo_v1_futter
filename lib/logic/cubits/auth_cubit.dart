import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Unauthenticated());

  void signIn() {
    // Simule une connexion
    emit(Authenticated());
  }

  void signOut() {
    emit(Unauthenticated());
  }
}
