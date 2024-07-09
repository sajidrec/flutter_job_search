import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:job_search/data/models/job_data_model.dart';

class FavouriteJobProvider extends ChangeNotifier {
  final List<JobDataModel> _favJobList = [];

  List<JobDataModel> get getFavJobList => _favJobList;

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

  Future<void> requestFavouriteJobList() async {
    _favJobList.clear();

    FirebaseFirestore db = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    db
        .collection("allFavouriteJobList")
        .doc("user${firebaseAuth.currentUser?.uid ?? ""}")
        .collection("favJobLists")
        .get()
        .then(
      (value) {
        for (int i = 0; i < value.docs.length; i++) {
          _favJobList.insert(
            0,
            JobDataModel.fromJson(
              value.docs[i].data(),
            ),
          );
        }
        notifyListeners();
      },
    );
  }
}
