// import 'dart:html';

// import 'dart:html';

// import 'package:authentication_provider/authentication_provider.dart';
// import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';flutt
// import 'package:form_validation/form_validation.dart';
import 'package:sign_in_auth_using_bloc/bloc/sign_in_event.dart';
import 'package:sign_in_auth_using_bloc/bloc/sign_in_state.dart';
// import 'package:validation_textformfield/validation_textformfield.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  EmailValidator emailValidator = EmailValidator();

  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (event.emailvalue == '' &&
          EmailValidator.validate(event.emailvalue) == false) {
        emit(SignInErrorState("Please Enter Valid Email!"));
      } else if (event.passwordvalue.length < 8) {
        emit(SignInErrorState("Please Enter Valid Password!"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmitEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
