import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_lookups/lookup_state.dart';

class LookupCubit extends Cubit<LookupState> {
  LookupCubit() : super(LookupInitial());

  void getLookup() async {
    emit(LookupLoading());
    try {
      emit(LookupSuccess());
    } on Exception catch (_) {
      emit(LookupFailure());
    }
  }
}
