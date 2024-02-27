import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ActivationController {
  Future<void> userEsim(
      {required String iCCID, required String plan_ID}) async {
    print(iCCID);
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user_eSIMs')
          .where('ICCID', isEqualTo: iCCID)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return;
      }

      Map<String, dynamic> payload = {
        'ICCID': iCCID,
        'plan_ID': plan_ID,
        'user_ID': FirebaseAuth.instance.currentUser!.uid
      };
      await FirebaseFirestore.instance.collection('user_eSIMs').add(payload);
    } catch (e) {
      // print('Error adding document: $e');
    }
  }
}
