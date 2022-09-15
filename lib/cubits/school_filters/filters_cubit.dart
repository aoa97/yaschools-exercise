import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';

class FiltersCubit extends Cubit<Map<LookupType, FilterModel>> {
  FiltersCubit() : super({});

  clearFilters() {
    state.clear();
  }

  removeFilterItem(LookupType type) {
    if (type == LookupType.city) {
      state.remove(LookupType.district);
    }
    state.remove(type);
    emit({...state});
  }

  setSelFilters(LookupType type, FilterModel model) {
    if (!state.containsKey(type)) {
      state.putIfAbsent(type, () => model);
    } else {
      if (state[type]!.valAr == model.valAr && model.isRemovable!) {
        state.remove(type);
      } else if (state.containsKey(type)) {
        state.update(type, (curVal) => model);
      } else if (state[type]!.filterVal == true) {
        state.remove(type);
      }
    }

    if (type == LookupType.city) {
      removeFilterItem(LookupType.district);
    }

    emit({...state});
  }
}
