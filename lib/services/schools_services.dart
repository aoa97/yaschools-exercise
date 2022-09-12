import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaschools/models/school_model.dart';

class SchoolsServices {
  SchoolsServices._();

  static final instance = SchoolsServices._();

  String baseURl = 'https://qcapps.yaschools.com/parent/school/search';

  Future<List<SchoolModel>> fetchSchools() async {
    final uri = Uri.parse(baseURl);
    final resJSON = await http.get(uri);
    final res = jsonDecode(resJSON.body) as Map<String, dynamic>;
    final items = res['data']['items'];
    final List<SchoolModel> loaded = [];
    items.forEach((item) => loaded.add(SchoolModel.fromMap(item)));
    return loaded;
  }
}
