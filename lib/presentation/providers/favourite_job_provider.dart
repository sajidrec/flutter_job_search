import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:job_search/data/models/job_data_model.dart';

class FavouriteJobProvider extends ChangeNotifier {
  Future<void> addToFavourite({
    required JobDataModel jobDetails,
  }) async {
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseFireStore
        .collection("allFavouriteJobList")
        .doc("user${firebaseAuth.currentUser?.uid ?? ""}")
        .collection("favJobLists")
        .doc(jobDetails.jobId)
        .set(
          jobDetails.toJson(),
        );
  }
}
