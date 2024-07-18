import 'package:al_rasef/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:al_rasef/features/Auth/presentation/manger/sign_up_cubit/sign_up_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInit());

  Future<void> signUp(email, password, phoneNumber, name, address) async {
    try {
      emit(SignUpLoading());

      var userCredential = await AuthRepoImpl()
          .signUp(name, email, phoneNumber, password, address);
      if (userCredential.user!.emailVerified) {
        emit(SignUpFailure(errorMessage: "Verification email sent to you"));
      } else {
        emit(SignUpSuccess(
            successMessage: "تم تسيجل حسابك بنجاح تحقق من بريدك الالكتروني"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(errorMessage: "هذا الحساب مستخدم بالفعل !!"));
      }
    } catch (e) {
      emit(SignUpFailure(errorMessage: "Something want wrong !!"));
    }
  }
}
