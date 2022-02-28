import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weighty/core/_core.dart';
import 'package:weighty/services/_services.dart';

class FirestoreService implements IFirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final _authService = locator<IAuthenticationService>();

  CollectionReference _getWeightColl() {
    return _userColl.doc(_authService.currentUser?.uid).collection("weights");
  }

  @override
  Future<void> addWeight(WeightInput input) async {
    await _getWeightColl()
        .doc("${input.dateTime.microsecondsSinceEpoch}")
        .set(input.toMap());
  }

  @override
  Future<void> updateWeight(WeightInput input) async {
    await _getWeightColl()
        .doc("${input.dateTime.microsecondsSinceEpoch}")
        .update(input.toUpdateMap());
  }

  @override
  Future<void> deleteWeight(WeightInput input) async {
    await _getWeightColl()
        .doc("${input.dateTime.microsecondsSinceEpoch}")
        .delete();
  }

  @override
  Stream<List<WeightInput>> weightStream() {
    return _getWeightColl().snapshots().transform<List<WeightInput>>(
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<WeightInput>>.fromHandlers(
        handleData: (data, sink) {
          final _weightList = <WeightInput>[];
          for (var weightInfo in data.docs) {
            _weightList.add(
              WeightInput.fromMap(weightInfo.data()),
            );
          }
          sink.add(_weightList.reversed.toList());
        },
      ),
    );
  }

  CollectionReference get _userColl => _firestore.collection("users");
}
