import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegeterian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
        });

  void setFilters(Map<Filter,bool> chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());
