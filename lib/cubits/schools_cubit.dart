import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_state.dart';
import 'package:yaschools/services/schools_services.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  SchoolsCubit() : super(SchoolsInitial());

  void getSchools() async {
    emit(SchoolsLoading());
    try {
      final schools = await SchoolsServices.instance.fetchSchools();
      emit(SchoolsSuccess(schools: schools));
    } on Exception catch (_) {
      emit(SchoolsFailure());
    }
  }
}
