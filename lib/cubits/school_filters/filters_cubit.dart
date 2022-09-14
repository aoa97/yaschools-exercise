import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';

class FiltersCubit extends Cubit<Map<LookupType, FilterModel>> {
  FiltersCubit() : super({});

  removeFilterItem(LookupType type) {
    state.remove(type);
    emit({...state});
  }

  get filterValues {
    return state.values.toList();
  }

  setSelFilters(LookupType type, FilterModel model) {
    if (!state.containsKey(type)) {
      state.putIfAbsent(type, () => model);
    } else if (state[type]!.filterVal == true) {
      state.remove(type);
    } else if (model.isRemovable! && state[type]!.valAr == model.valAr) {
      state.remove(type);
    } else if (state.containsKey(type)) {
      state.update(type, (curVal) => model);
    }

    emit({...state});
  }
}
