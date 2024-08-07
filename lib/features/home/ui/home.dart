// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test1/features/cart/ui/cart.dart';
import 'package:flutter_test1/features/home/bloc/home_bloc.dart';
import 'package:flutter_test1/features/home/ui/product_tile_widget.dart';
import 'package:flutter_test1/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeLaptopsEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  List<bool> isPressedList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WishList()));
        } else if (state is HomeProductCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item added to Cart')));
        } else if (state is HomeProductWishListedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item added to Wish List')));
        }
      },
      builder: (context, state) {
        if (state is HomeLaptopsLoadedState) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              backgroundColor: Colors.white.withOpacity(0.9),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishListButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 28,
                    )),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Colors.orange,
                      size: 28,
                    )),
              ],
              title: Text(
                'Hi, Marcus!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7)),
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCategoryButton('iPhones', 0, () {
                          setState(() {
                            isPressedList = [true, false, false, false];
                          });
                          homeBloc.add(HomeIphoneEvent());
                        }),
                        buildCategoryButton('TV', 1, () {
                          setState(() {
                            isPressedList = [false, true, false, false];
                          });
                          homeBloc.add(HomeTvEvent());
                        }),
                        buildCategoryButton('PC', 2, () {
                          setState(() {
                            isPressedList = [false, false, true, false];
                          });
                          homeBloc.add(HomePcEvent());
                        }),
                        buildCategoryButton('Laptops', 3, () {
                          setState(() {
                            isPressedList = [false, false, false, true];
                          });
                          homeBloc.add(HomeLaptopsEvent());
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                        childAspectRatio: 0.81),
                    itemCount: state.products.length,
                    itemBuilder: ((context, index) {
                      return ProductTile(
                        productDataModel: state.products[index],
                        homeBloc: homeBloc,
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        } else if (state is HomeLoadingState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeErrorState) {
          return Scaffold(
            body: Center(
              child: Text('Error went'),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget buildCategoryButton(String text, int index, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 85,
        decoration: BoxDecoration(
          color: isPressedList[index] ? Colors.deepOrange : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isPressedList[index]
                      ? Colors.white
                      : Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
