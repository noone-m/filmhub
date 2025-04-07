import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmhub_app/core/domain/entities/media.dart';
import 'package:filmhub_app/movies/domain/usecases/get_all_popular_movies_usecase.dart';

import 'package:filmhub_app/core/utils/enums.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetAllPopularMoviesUseCase _allPopularMoviesUseCase;
  int page = 1;
  
  PopularMoviesBloc(this._allPopularMoviesUseCase)
      : super(const PopularMoviesState()) {
    on<GetPopularMoviesEvent>(_getAllPopularMovies);
    on<FetchMorePopularMoviesEvent>(_fetchMoreMovies);
  }

  Future<void> _getAllPopularMovies(
      GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    await _handleFetch(emit, GetAllRequestStatus.error);
  }

  Future<void> _fetchMoreMovies(FetchMorePopularMoviesEvent event,
      Emitter<PopularMoviesState> emit) async {
    await _handleFetch(emit, GetAllRequestStatus.fetchMoreError);
  }

  Future<void> _handleFetch(
    Emitter<PopularMoviesState> emit,
    GetAllRequestStatus errorStatus,
  ) async {
    final result = await _allPopularMoviesUseCase(page);
    // print("reslut is $result, type of result is ${result.runtimeType}");  type of result is Right<Failure, List<Media>> or Left
    result.fold(
      (l) => emit(state.copyWith(status: errorStatus)),
      (r) {
        page++;
        emit(
          state.copyWith(
            status: GetAllRequestStatus.loaded,
            movies: state.movies + r,
          ),
        );
      },
    );
  }
}
