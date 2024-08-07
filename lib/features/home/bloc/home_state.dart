part of 'home_bloc.dart';

@immutable
abstract class HomeState { }

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLaptopsLoadedState extends HomeState {
  final List<ProductDataModel> products;

  HomeLaptopsLoadedState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductWishListedActionState extends HomeActionState {}

class HomeProductCartedActionState extends HomeActionState {}

class HomeIphonesLoadedState extends HomeState {
  final List<ProductDataModel> products;

  HomeIphonesLoadedState({required this.products});
}

class HomeTvLoadedState extends HomeState{ 
  final List<ProductDataModel> products;


  HomeTvLoadedState({required this.products});}

class HomePcLoadedState extends HomeState{ 
  final List <ProductDataModel> products;

  HomePcLoadedState({required this.products});
}
