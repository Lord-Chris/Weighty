import 'dart:convert';

import 'package:intl/intl.dart';

class WeightInput {
  final double weight;
  final DateTime dateTime;

  WeightInput({
    required this.weight,
    required this.dateTime,
  });

  String get dateString =>
      DateFormat("EEE, d MMM yyyy on h:mm a").format(dateTime);

  @override
  String toString() => 'WeightInput(weight: $weight, dateTime: $dateTime)';

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'date_time': dateTime.microsecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      'weight': weight,
    };
  }

  factory WeightInput.fromMap(Map<String, dynamic> map) {
    return WeightInput(
      weight: map['weight']?.toDouble() ?? 0.0,
      dateTime: DateTime.fromMicrosecondsSinceEpoch(map['date_time']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightInput.fromJson(String source) =>
      WeightInput.fromMap(json.decode(source));

  WeightInput copyWith({
    double? weight,
    DateTime? dateTime,
  }) {
    return WeightInput(
      weight: weight ?? this.weight,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
