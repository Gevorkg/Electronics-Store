// ignore_for_file: depend_on_referenced_packages, avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test1/data/cart_items.dart';
import 'package:flutter_test1/data/items_data.dart';
import 'package:flutter_test1/data/wishlist_items.dart';
import 'package:flutter_test1/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeLaptopsEvent>(homeLaptopsEvent);
    on<HomeIphoneEvent>(homeIphoneEvent);
    on<HomePcEvent>(homePcEvent);
    on<HomeTvEvent>(homeTvEvent);
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<FutureOr<void>> homeLaptopsEvent(
      HomeLaptopsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLaptopsLoadedState(
        products: LaptopData.laptopsProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductCartedActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wish List Navigate Clicked');
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
     await Future.delayed(Duration(seconds: 3));
    emit(HomeInitialState());
  }

  Future<FutureOr<void>> homeIphoneEvent(HomeIphoneEvent event, Emitter<HomeState> emit) async {
     emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLaptopsLoadedState(
        products: IphonesData.iphonesProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  Future<FutureOr<void>> homePcEvent(HomePcEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLaptopsLoadedState(
        products: PCData.pcProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  Future<FutureOr<void>> homeTvEvent(HomeTvEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 1));
    emit(HomeLaptopsLoadedState(
        products: TVData.tvProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }
}
