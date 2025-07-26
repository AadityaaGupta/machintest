import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:machintest/Blocs/loginWithGoogleBloc/login_with_google_event.dart';
// import 'package:machintest/Blocs/loginWithGoogleBloc/login_with_google_state.dart';
import 'package:flutter/material.dart';
import 'package:machinetest2/Blocs/loginWithGoogleBloc/login_with_google_event.dart';
import 'package:machinetest2/Blocs/loginWithGoogleBloc/login_with_google_state.dart';

class LoginWithGoogleBloc extends Bloc<LoginWithGoogleEvent,LoginWithGoogleState> {

  LoginWithGoogleBloc() : super(LoginWithGoogleInitial()) {
    // on<OnLoginButttonPressed>((event, emit) async {
    //   emit(LoginWithGoogleLoading());
    //   Session preferenceHelper = Session();
    //   String? name = await preferenceHelper.();
    //   if (name == null || name.isEmpty) {
    //     try {
    //       await signInWithGoogle(event.context);
    //     } catch (e) {
    //       print("Exception in signInWithGoogle ----> ${e}");
    //     }
    //   } else {
    //     Navigator.pushReplacement(
    //         event.context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   }
    // });
  }

  // signInWithGoogle(BuildContext context) async {
  //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn() ;

  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount!.authentication;

  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken);

  //   UserCredential result = await firebaseAuth.signInWithCredential(credential);



  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //   }
  }
