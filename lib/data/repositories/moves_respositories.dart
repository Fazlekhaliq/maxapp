import 'package:maxapp/networks/network_helper.dart';
import 'package:maxapp/utils/url.dart';

import '../model/moves_model.dart';

class MovesRepositories{
  Future<MoviesModel> getMovies()async{
    NetworkHelper networkHelper=NetworkHelper(url: movesUrl);
    final moveisRepositories= await networkHelper.getData();
     final MoviesModel moviesModel=MoviesModel.fromJson(moveisRepositories);
      return moviesModel;
  }

}