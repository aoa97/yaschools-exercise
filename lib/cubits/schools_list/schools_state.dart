import 'package:yaschools/models/school_model.dart';

abstract class SchoolsState {}

class SchoolsInitial extends SchoolsState {}

class SchoolsLoading extends SchoolsState {}

class SchoolsSuccess extends SchoolsState {}

class SchoolsFailure extends SchoolsState {}
