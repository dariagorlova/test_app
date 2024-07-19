part of 'home_bloc.dart';

sealed class HomeState {
  const HomeState();

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeSuccess extends HomeState {
  final List<HomeData> data;
  const HomeSuccess({required this.data});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeSuccess && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class HomeProcess extends HomeState {
  const HomeProcess();
}
