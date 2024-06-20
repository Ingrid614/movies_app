import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ludokin_agent/data/models/movie.dart';

abstract class MovieState {}

class InitialMovieState extends MovieState{}

class SendingMovie extends MovieState{}

class MovieSent extends MovieState{
  final Command command;
  MovieSent(this.movie);
}

class SendingFailed extends CommandState{
  final String message ;
  SendingFailed(this.message);
}

class LoadingMovie extends MovieState{}

class LoadingMovieFailed extends MovieState {
  final String message;
  LoadingMovieFailed(this.message);
}
class LoadingMovieSuccess extends MovieState{
  // final Rx<List<Movie>> movies;
  // LoadingMovieSuccess(this.movies);
}
