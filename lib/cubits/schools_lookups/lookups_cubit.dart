import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/services/lookups_services.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_state.dart';

class LookupsCubit extends Cubit<LookupsState> {
  LookupsCubit() : super(LookupsInitial());

  List<LookupModel> curriculums = [];
  List<LookupModel> stages = [];
  List<LookupModel> students = [];
  List<LookupModel> categories = [];
  bool? hasInstallment;
  bool? hasDiscount;

  void getLookups() async {
    final services = LookupsServices.instance;
    emit(LookupsLoading());
    try {
      curriculums = await services.fetchLookup(LookupType.curriculum);
      stages = await services.fetchLookup(LookupType.stage);
      students = await services.fetchLookup(LookupType.student);
      categories = await services.fetchLookup(LookupType.category);
      emit(LookupsSuccess());
    } on Exception catch (_) {
      emit(LookupsFailure());
    }
  }
}
