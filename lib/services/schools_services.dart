import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaschools/models/school_model.dart';
import 'package:yaschools/utils/assets.dart';

class SchoolsServices {
  SchoolsServices._();

  static final instance = SchoolsServices._();

  Future<List<SchoolModel>> fetchSchools() async {
    var url = '${AppAssets.baseUrl}/parent/school/search';
    final resJSON = await http.get(Uri.parse(url));
    final res = jsonDecode(resJSON.body) as Map<String, dynamic>;
    final items = res['data']['items'];
    final List<SchoolModel> loaded = [];
    items.forEach((item) => loaded.add(SchoolModel.fromMap(item)));
    return loaded;
  }
}
