import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_test1/data/cart_items.dart';
import 'package:flutter_test1/data/wishlist_items.dart';
import 'package:flutter_test1/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc() : super(WishInitial()) {
    on<WishInitialEvent>(wishInitialEvent);
    on<WishToCartEvent>(wishToCartEvent);
    on<RemoveFromWishEvent>(removeFromWishEvent);
  }

  FutureOr<void> wishInitialEvent(WishInitialEvent event, Emitter<WishState> emit) {
    emit(WishSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishToCartEvent(WishToCartEvent event, Emitter<WishState> emit) {
    cartItems.add(event.cartedProduct);
    emit(WishToCartState());
    
  }

  FutureOr<void> removeFromWishEvent(RemoveFromWishEvent event, Emitter<WishState> emit) {
    wishlistItems.remove(event.cartedProduct);
    emit(WishSuccessState(wishlistItems: wishlistItems));
  }
}
