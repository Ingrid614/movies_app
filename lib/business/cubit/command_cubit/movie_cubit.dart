import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludokin_agent/data/providers/api_provider.dart';
import 'package:ludokin_agent/data/repositories/api_repository.dart';
import '../../../data/models/movie.dart';
import 'movie_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MovieCubit extends Cubit<MovieState>{
  MovieCubit():super(InitialMovieState());
  final ApiProvider _apiProvider = ApiProvider();
  Rx<List<Movie>> movies = Rx<List<Movie>>([]);

  Future <void> getAllMovies() async {
    ApiRepository apiRepository = ApiRepository(_apiProvider);
    emit(LoadingMovie());
    print('loading commands');
    try{
      Future.delayed(const Duration(seconds: 4),(){});
      var response = await apiRepository.getAllMovies();
      movies = response;
      emit(LoadingMovieSuccess());
      print(response);
    }catch(e){
      print(e.toString());
      emit(LoadingMovieSuccess());
      // emit(LoadingMovieFailed('loadingMovieFailed'.tr()));
    }
  }
  
    }
  }

  @override
  void onChange(Change<CommandState> change) {
    super.onChange(change);
    print(change);
  }
}
