import 'package:weighty/core/models/weight_input_model.dart';

abstract class IFirestoreService {
  Future<void> addWeight(WeightInput input);
  Future<void> updateWeight(WeightInput input);
  Future<void> deleteWeight(WeightInput input);
  Stream<List<WeightInput>> weightStream();
}
