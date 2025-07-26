import 'package:flutter/material.dart';
import 'package:machinetest2/Screens/Auth/login_screen.dart';
import 'package:machinetest2/Screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Signup Screen',
            ),
            ElevatedButton(
              onPressed: () {
                // Handle signup logic here
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()) );
              },
              child: const Text('Sign Up'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()) );
                  },
                  child: const Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}