part of 'wish_bloc.dart';

@immutable
sealed class WishEvent {}

class WishInitialEvent extends WishEvent {}

class WishToCartEvent extends WishEvent {
  final ProductDataModel cartedProduct;


  WishToCartEvent({required this.cartedProduct});}

class RemoveFromWishEvent extends WishEvent{ 
  final ProductDataModel cartedProduct;

  RemoveFromWishEvent({required this.cartedProduct});
}
