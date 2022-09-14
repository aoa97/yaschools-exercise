import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/utils/enums.dart';

class LookupsServices {
  LookupsServices._();

  static final instance = LookupsServices._();

  Future<List<LookupModel>> fetchLookup(LookupType type, {int? id}) async {
    var lookup = '';

    switch (type) {
      case LookupType.district:
        lookup = 'districts/$id';
        break;
      case LookupType.city:
        lookup = 'cities';
        break;
      case LookupType.category:
        lookup = 'categories';
        break;
      case LookupType.student:
        lookup = 'genders';
        break;
      case LookupType.stage:
        lookup = 'stages';
        break;
      case LookupType.curriculum:
      default:
        lookup = 'curriculum';
    }

    var url = '${AppAssets.baseUrl}/lookups/$lookup';
    final res = await Dio().get(url);
    final items = res.data['data'];
    final List<LookupModel> loaded = [];
    items.forEach((item) => loaded.add(LookupModel.fromMap(item, type)));
    return loaded;
  }
}
