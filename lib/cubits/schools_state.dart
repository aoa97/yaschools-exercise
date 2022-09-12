import 'package:yaschools/models/school_model.dart';

abstract class SchoolsState {}

class SchoolsInitial extends SchoolsState {}

class SchoolsLoading extends SchoolsState {}

class SchoolsSuccess extends SchoolsState {
  final List<SchoolModel> schools;

  SchoolsSuccess({required this.schools});
}

class SchoolsFailure extends SchoolsState {}
