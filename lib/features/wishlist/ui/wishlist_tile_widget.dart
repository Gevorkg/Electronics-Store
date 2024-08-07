// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test1/features/home/models/home_product_data_model.dart';
import 'package:flutter_test1/features/wishlist/bloc/wish_bloc.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishBloc wishBloc;
  const WishListTileWidget(
      {super.key, required this.productDataModel, required this.wishBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(productDataModel.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(productDataModel.description),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$' + productDataModel.price.toString(),
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          wishBloc.add(
                              WishToCartEvent(cartedProduct: productDataModel));
                          wishBloc.add(RemoveFromWishEvent(
                              cartedProduct: productDataModel));
                        },
                        icon: Icon(
                          Icons.wallet,
                          color: Colors.green,
                          size: 28,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
