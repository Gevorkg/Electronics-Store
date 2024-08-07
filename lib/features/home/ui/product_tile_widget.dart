// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test1/features/home/bloc/home_bloc.dart';
import 'package:flutter_test1/features/home/models/home_product_data_model.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTile(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: Text(productDataModel.name,
                maxLines: 1,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(productDataModel.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                )),
          ),
          Expanded(child: Container()), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$' + productDataModel.price.toString(),
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeBloc.add(HomeProductWishListButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ));
                      },
                      child: Icon(
                        Icons.favorite_border,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 12), 
                    GestureDetector(
                      onTap: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel,
                        ));
                      },
                      child: Icon(
                        Icons.shopping_bag,
                        size: 22,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
