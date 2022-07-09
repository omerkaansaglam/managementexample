part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  const HomeLoading();

  @override
  List<Object> get props => [];
}

class HomeCompleted extends HomeState {
  final UserModel model;
  final List<OrdersModel> orders;
  const HomeCompleted(this.model, this.orders);
  @override
  List<Object> get props => [model,orders];
}

class HomeError extends HomeState {
  const HomeError();
}
