import 'package:dio/dio.dart';
import 'package:yaschools/models/school_model.dart';
import 'package:yaschools/utils/assets.dart';

class SchoolsServices {
  SchoolsServices._();

  static final instance = SchoolsServices._();

  Future<List<SchoolModel>> fetchSchools({Map<String, dynamic>? params}) async {
    var url = '${AppAssets.baseUrl}/parent/school/search';

    final res = await Dio().get(url, queryParameters: params);
    final items = res.data['data']['items'];
    final List<SchoolModel> loaded = [];
    items.forEach((item) => loaded.add(SchoolModel.fromMap(item)));
    return loaded;
  }
}
