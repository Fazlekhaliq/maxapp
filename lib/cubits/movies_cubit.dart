import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'movies_state.dart';
class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());
 Future <void> fetchMovies()async {
   emit(MoviesLoading());
   emit(MoviesLoadedSuccess());
   emit(MoviesLoadedFailure());
 }
}
