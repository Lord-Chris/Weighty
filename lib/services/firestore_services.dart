import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weighty/core/models/weight_input_model.dart';
import 'package:weighty/services/authentication_service.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final _authService = AuthenticationService();

  CollectionReference _getWeightColl() {
    print(_authService.currentUser?.uid);
    return _userColl.doc(_authService.currentUser?.uid).collection("weights");
  }

  Future<void> addWeight(WeightInput input) async {
    await _getWeightColl().add(input.toMap());
  }

  Future<void> updateWeight(String docId, WeightInput input) async {
    await _getWeightColl().doc(docId).update(input.toUpdateMap());
  }

  Stream<List<WeightInput>> weightStream() {
    return _getWeightColl().snapshots().transform<List<WeightInput>>(
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
              List<WeightInput>>.fromHandlers(
            handleData: (data, sink) {
              final _weightList = <WeightInput>[];
              for (var weightInfo in data.docs) {
                print(weightInfo.data());
                _weightList.add(
                  WeightInput.fromMap(weightInfo.data()),
                );
              }
              sink.add(_weightList);
            },
            handleError: (obj, st, sink) {
              sink.add([]);
            },
          ),
        );
  }

  CollectionReference get _userColl => _firestore.collection("users");
}
