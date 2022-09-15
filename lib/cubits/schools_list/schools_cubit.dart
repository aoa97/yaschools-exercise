import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/services/schools_services.dart';
import 'package:yaschools/utils/enums.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  SchoolsCubit() : super(SchoolsInitial());
  int currentPage = 1;
  Map<LookupType, FilterModel> currentFilters = {};

  get filterValues {
    return currentFilters.values.toList();
  }

  get filterKeys {
    return currentFilters.keys.toList();
  }

  Future<void> getSchools({
    Map<LookupType, FilterModel>? filters,
    String? searchQuery,
    bool? isNextPage,
  }) async {
    Map<String, dynamic> queryParams = {};

    currentFilters = {};

    if (filters != null) {
      currentFilters = filters;
      for (FilterModel e in filters.values.toList()) {
        queryParams.putIfAbsent(e.filterKey, () => e.filterVal);
      }
    }

    if (searchQuery != null) {
      queryParams.addAll({'name': searchQuery});
    }

    if (isNextPage != null && isNextPage) {
      currentPage = currentPage + 1;
      queryParams.addAll({'dp-1-page': currentPage});
    }

    final services = SchoolsServices.instance;

    emit(SchoolsLoading());

    try {
      final schools = await services.fetchSchools(params: queryParams);
      emit(SchoolsSuccess(schools: schools, isReachedMax: schools.isEmpty));
    } on Exception catch (_) {
      emit(SchoolsFailure());
    }
  }
}
