// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shop_app/Layout/Shop_Cubit.dart';
import 'package:shop_app/modules/Search.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    ShopCubit cubit = ShopCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salla'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: cubit.screens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: cubit.currentIndex,
        onTap: ((index) {
          cubit.changeNavBar(index);
        }),
      ),
    );
  }
}
