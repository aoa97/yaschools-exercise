import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/services/schools_services.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  SchoolsCubit() : super(SchoolsInitial());

  void getSchools({List<FilterModel>? filters, String? searchQuery}) async {
    Map<String, dynamic> queryParams = {};

    if (filters != null) {
      for (FilterModel e in filters) {
        queryParams.putIfAbsent(e.filterKey, () => e.filterVal);
      }
    }

    if (searchQuery != null) {
      queryParams.addAll({'name': searchQuery});
    }

    final services = SchoolsServices.instance;

    emit(SchoolsLoading());

    try {
      final schools = await services.fetchSchools(params: queryParams);
      emit(SchoolsSuccess(schools: schools));
    } on Exception catch (_) {
      emit(SchoolsFailure());
    }
  }
}
