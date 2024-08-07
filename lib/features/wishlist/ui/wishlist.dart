// ignore_for_file: prefer_const_constructors, type_literal_in_constant_pattern, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test1/features/wishlist/bloc/wish_bloc.dart';
import 'package:flutter_test1/features/wishlist/ui/wishlist_tile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishBloc wishBloc = WishBloc();
  @override
  void initState() {
    wishBloc.add(WishInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wish List')),
      body: BlocConsumer<WishBloc, WishState>(
        bloc: wishBloc,
        listener: (context, state) {
          if (state is WishToCartState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item added to Cart '),
            ));
          }
        },
        listenWhen: (previous, current) => current is WishActionState,
        buildWhen: (previous, current) => current is! WishActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishSuccessState:
              final successState = state as WishSuccessState;
              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: ((context, index) {
                    return WishListTileWidget(
                      productDataModel: successState.wishlistItems[index],
                      wishBloc: wishBloc,
                    );
                  }));

            default:
          }
          return Container();
        },
      ),
    );
  }
}
