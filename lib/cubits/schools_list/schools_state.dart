import 'package:yaschools/models/school_model.dart';

abstract class SchoolsState {}

class SchoolsInitial extends SchoolsState {}

class SchoolsLoading extends SchoolsState {}

class SchoolsSuccess extends SchoolsState {
  final List<SchoolModel> schools;
  final bool? isReachedMax;
  SchoolsSuccess({required this.schools, this.isReachedMax});
}

class SchoolsFailure extends SchoolsState {}
