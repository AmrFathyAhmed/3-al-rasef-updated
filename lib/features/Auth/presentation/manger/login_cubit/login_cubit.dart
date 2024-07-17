
import 'package:al_rasef/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:al_rasef/features/Auth/presentation/manger/login_cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit():super(LoginInit());


  Future<void> login(email, password) async {
    try {
      emit(LoginLoading());

      var userCredential = await AuthRepoImpl().logIn(email, password);
      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        emit(LoginFailure(errorMessage: "Verification email sent to you"));
      } else {
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            errorMessage: "Wrong password provided for that user.."));
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: "Something want wrong !!"));
    }
  }
}
