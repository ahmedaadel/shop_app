import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/Shop_Cubit.dart';
import 'package:shop_app/Layout/shopLayout.dart';
import 'package:shop_app/Layout/shop_States.dart';
import 'package:shop_app/modules/Login/LoginScreen.dart';
import 'package:shop_app/modules/onBoarding.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/Local/cache.dart';
import 'package:shop_app/shared/network/remote.dart';
import 'package:shop_app/styles/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHeloer.initDio();
  await Cache_Helper.init();
  Widget wid = Container();
  bool? onBoard = Cache_Helper.getData(key: 'OnBoarding');
  userToken = Cache_Helper.getData(key: 'token');

  if (onBoard != null) {
    if (userToken != null) {
      wid = const ShopLayout();
    } else {
      wid = LoginScreen();
    }
  } else {
    wid = OnBoarding_Screen();
  }

  runApp(MyApp(wid));
}

class MyApp extends StatelessWidget {
  final Widget currentScreen;
  const MyApp(this.currentScreen, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShopCubit()..getData(),
          )
        ],
        child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              home: ShopLayout(),
            );
          },
        ));4
  }
}
