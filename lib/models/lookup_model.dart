import 'package:yaschools/utils/enums.dart';

class LookupModel {
  final int? id;
  final String name;
  final LookupType type;

  LookupModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory LookupModel.fromMap(Map<String, dynamic> data, LookupType type) {
    return LookupModel(
      id: data['id'],
      name: data['name'],
      type: type,
    );
  }
}
