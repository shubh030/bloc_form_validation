import 'package:bloc_form_validation/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloc_form_validation/screens/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Wellcome",
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SignInBloc(),
                    child: SignInView(),
                  ),
                ),
              );
            },
            child: Text(
              "Sign In",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
