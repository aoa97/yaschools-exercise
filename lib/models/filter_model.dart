class FilterModel {
  final String filterKey;
  final dynamic filterVal;
  final String typeAr;
  final String valAr;
  final bool? isRemovable;

  FilterModel({
    required this.filterKey,
    required this.filterVal,
    required this.typeAr,
    required this.valAr,
    this.isRemovable,
  });
}
