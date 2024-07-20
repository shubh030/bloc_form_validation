import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignTextChanged>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Plse Provide valid Email"));
      } else if (event.passValue.length < 6) {
        emit(SignInErrorState("Plse Provide valid Password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmit>((event, emit) {
      emit(
        SignLoadingState(),
      );
    });
  }
}
