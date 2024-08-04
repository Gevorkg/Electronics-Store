import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';


part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial()) {
    on<CartblocEvent>((event, emit) {
      
    });
  }
}
