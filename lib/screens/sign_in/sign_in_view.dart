import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  state.errorMessage,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.red),
                );
              } else {
                return Container();
              }
            },
          ),
          TextField(
            controller: emailController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(
                  SignTextChanged(emailController.text, passController.text));
            },
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: passController,
            decoration: const InputDecoration(hintText: "Password"),
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(
                  SignTextChanged(emailController.text, passController.text));
            },
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignLoadingState) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (state is SignInValidState)
                            ? Colors.purple
                            : Colors.grey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(SignInSubmit(
                            emailController.text, passController.text));
                      }
                    },
                    child: const Text("Sign In"));
              }
            },
          )
        ],
      ),
    );
  }
}
