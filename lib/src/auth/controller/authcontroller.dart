// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  Future<UserCredential> loginInTheFirebase(
    String email,
    String pass,
  ) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    return credential;
  }

  Future<void> creatingUser(
      {required String email,
      required String pass,
      required String name}) async {
    try {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (credentials.user!.uid.isNotEmpty) {
        Map<String, dynamic> payload = {
          "email": email,
          "name": name,
          "user_ID": credentials.user!.uid
        };
        await FirebaseFirestore.instance
            .collection('User_Credentials')
            .add(payload);
      } else {
        print('Kindly fill all of the fields');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore
          .instance
          .collection('User_Credentials')
          .where("user_ID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData = userSnapshot.docs.first.data();
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      
    } catch (e) {
      print(e);
    }
  }

  Future<void> forgetPass(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
       const snackBar = SnackBar(
        content: Text('we have Send you an Email at your email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('NO email found'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
