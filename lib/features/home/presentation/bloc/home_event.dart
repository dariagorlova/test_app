part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class OnFetchData extends HomeEvent {
  const OnFetchData();
}
