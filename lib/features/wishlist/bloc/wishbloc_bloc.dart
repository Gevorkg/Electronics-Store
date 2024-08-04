// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishbloc_event.dart';
part 'wishbloc_state.dart';

class WishblocBloc extends Bloc<WishblocEvent, WishblocState> {
  WishblocBloc() : super(WishblocInitial()) {
    on<WishblocEvent>((event, emit) {
      
    });
  }
}
