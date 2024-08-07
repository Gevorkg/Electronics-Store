// ignore_for_file: non_constant_identifier_names

part of 'wish_bloc.dart';

@immutable
sealed class WishState {}

final class WishInitial extends WishState {}

abstract class WishActionState extends WishState {}

class WishSuccessState extends WishState {
  final List<ProductDataModel> wishlistItems;

  WishSuccessState({required this.wishlistItems});
}

class WishToCartState extends WishActionState{}

class RemoveFromWishState extends WishActionState{}