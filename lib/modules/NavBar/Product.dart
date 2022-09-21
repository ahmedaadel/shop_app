import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/Shop_Cubit.dart';
import 'package:shop_app/Layout/shop_States.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return BlocConsumer<ShopCubit, ShopStates>(
        builder: ((context, state) => ConditionalBuilder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  CarouselSlider(
                      items: cubit.homeModel?.data.banners
                          .map(
                            (e) => Image(
                              image: NetworkImage(e.image),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                          viewportFraction: 1.0,
                          height: 250,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal))
                ],
              );
            },
            condition: cubit.homeModel != null,
            fallback: (context) => Center(child: CircularProgressIndicator()))),
        listener: (context, state) {});
  }
}


// Scaffold(
//       appBar: AppBar(),
//       body: Center(child: Text('Product')),
//     );