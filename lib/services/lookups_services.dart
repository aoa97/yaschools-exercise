import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/utils/enums.dart';

class LookupsServices {
  LookupsServices._();

  static final instance = LookupsServices._();

  Future<List<LookupModel>> fetchLookup(LookupType type) async {
    var lookup = '';

    switch (type) {
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
    final resJSON = await http.get(Uri.parse(url));
    final res = jsonDecode(resJSON.body) as Map<String, dynamic>;
    final items = res['data'];
    final List<LookupModel> loaded = [];
    items.forEach((item) => loaded.add(LookupModel.fromMap(item, type)));
    return loaded;
  }
}
