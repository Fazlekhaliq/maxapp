part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}
class MoviesLoading extends MoviesState{}
class MoviesLoadedSuccess extends MoviesState{}
class MoviesLoadedFailure extends MoviesState{}