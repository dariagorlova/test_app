import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/home/index.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(const HomeInitial()) {
    on<OnFetchData>((event, emit) async {
      emit(const HomeProcess());
      final resultSignIn = await _repository.fetchData();

      // let's sort it by photographer name.
      resultSignIn?.sort((a, b) => a.photographer.compareTo(b.photographer));

      emit(resultSignIn == null
          ? const HomeFailure(message: 'Server error. Please try again')
          : HomeSuccess(data: resultSignIn));
    });
  }
}
