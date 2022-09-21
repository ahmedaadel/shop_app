// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/Login/LoginStates.dart';
import 'package:shop_app/models/Login_Model.dart';
import 'package:shop_app/shared/network/remote.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHeloer.postData(url: 'login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  bool isSecure = true;
  void visable() {
    isSecure = !isSecure;
    emit(LoginVisabilityState());
  }
}
