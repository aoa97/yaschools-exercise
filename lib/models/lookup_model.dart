import 'package:yaschools/utils/enums.dart';

class Lookup {
  final int id;
  final String name;
  final LookupType type;

  Lookup({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Lookup.fromMap(Map<String, dynamic> data, LookupType type) {
    return Lookup(
      id: data['id'],
      name: data['name'],
      type: type,
    );
  }
}
