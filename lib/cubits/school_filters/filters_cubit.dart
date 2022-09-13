import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/utils/enums.dart';

class FiltersCubit extends Cubit<Map<LookupType, dynamic>> {
  FiltersCubit() : super({});

  removeFilterItem(LookupType type) {
    final newState = {...state};
    newState.remove(type);
    emit(newState);
  }

  setSelFilters(LookupType type, dynamic value, {bool? isRemovable = false}) {
    final newState = {...state};

    if (state.containsKey(type) && state[type] == true) {
      newState.remove(type);
    } else if (isRemovable! && state[type] == value) {
      newState.remove(type);
    } else if (state.containsKey(type)) {
      newState.update(type, (curVal) => value);
    } else {
      newState.putIfAbsent(type, () => value);
    }

    emit(newState);
    print(state);
  }
}
