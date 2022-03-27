import 'package:flutter/material.dart';
import 'package:learning_track/data/firestore_helper.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FirestoreHelper.firestoreHelper.getAllCars();
        },
        child: Container(
          height: 100,
          width: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
