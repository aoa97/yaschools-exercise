import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/services/schools_services.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  SchoolsCubit() : super(SchoolsInitial());

  void getSchools({String? query}) async {
    final services = SchoolsServices.instance;

    emit(SchoolsLoading());
    try {
      final schools = await services.fetchSchools(query: query);
      emit(SchoolsSuccess(schools: schools));
    } on Exception catch (_) {
      emit(SchoolsFailure());
    }
  }
}
