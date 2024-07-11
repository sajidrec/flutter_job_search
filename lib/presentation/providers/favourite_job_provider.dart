import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:job_search/data/models/job_data_model.dart';

class FavouriteJobProvider extends ChangeNotifier {
  final List<JobDataModel> _favJobList = [];
  final List<String> _favJobIdList = [];

  List<JobDataModel> get getFavJobList => _favJobList;

  bool isFavourite({required jobId}) {
    return _favJobIdList.contains(jobId.toString());
  }

  Future<void> removeFromFavourite({
    required JobDataModel jobDetails,
  }) async {
    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseFireStore
        .collection("allFavouriteJobList")
        .doc("user${firebaseAuth.currentUser?.uid ?? ""}")
        .collection("favJobLists")
        .doc(jobDetails.jobId)
        .delete();

    _favJobList.remove(jobDetails);
    _favJobIdList.remove(jobDetails.jobId.toString());

    notifyListeners();
  }

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

    _favJobIdList.add(jobDetails.jobId.toString());

    notifyListeners();
  }

  Future<void> requestFavouriteJobList() async {
    _favJobList.clear();
    _favJobIdList.clear();

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
          JobDataModel jobDataModel = JobDataModel.fromJson(
            value.docs[i].data(),
          );
          _favJobList.add(jobDataModel);
          _favJobIdList.add(jobDataModel.jobId);
        }
        notifyListeners();
      },
    );
  }
}
