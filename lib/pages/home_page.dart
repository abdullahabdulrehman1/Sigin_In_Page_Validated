import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sign_in_auth_using_bloc/bloc/sign_in_bloc.dart';
import 'package:sign_in_auth_using_bloc/bloc/sign_in_event.dart';
// import 'package:sign_in_auth_using_bloc/bloc/sign_in_event.dart';
import 'package:sign_in_auth_using_bloc/bloc/sign_in_state.dart';
// import 'package:validation_textformfield/validation_textformfield.dart';

class HomePage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final signInBloc = BlocProvider.of<SignInBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (e) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailController.text, passwordController.text));
              },
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errormessage,
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  );
                } else {
                  return Container();
                }
                // return SizedBox();
              },
            ),
            SizedBox(height: 16.0),
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
              if (state is SignInLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              return CupertinoButton(
                onPressed: () {
                  BlocProvider.of<SignInBloc>(context).add(SignInSubmitEvent(
                      emailController.text, passwordController.text));
                },
                color: (state is SignInErrorState) ? Colors.red : Colors.green,
                child: Text("Submit!"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
