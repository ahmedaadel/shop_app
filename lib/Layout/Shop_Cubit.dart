// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/shop_States.dart';
import 'package:shop_app/models/Home_Model.dart';
import 'package:shop_app/modules/NavBar/Category.dart';
import 'package:shop_app/modules/NavBar/Favourite.dart';
import 'package:shop_app/modules/NavBar/Product.dart';
import 'package:shop_app/modules/NavBar/Settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/remote.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(InitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = const [
    FavouriteScreen(),
    CategoryScreen(),
    ProductsScreen(),
    SettingsScreen()
  ];
  void changeNavBar(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  HomeModel? homeModel;

  void getData() {
    emit(ShopLoadingGetData());
    DioHeloer.getData(url: 'home', token: userToken).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.status);
      emit(ShopSiccessGetData());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetData());
    });
  }
}
