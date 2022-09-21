import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Layout/shopLayout.dart';
import 'package:shop_app/modules/Login/LoginCubit.dart';
import 'package:shop_app/modules/Login/LoginStates.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/Local/cache.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel!.Status == true) {
              print(state.loginModel!.data!.token);
              Cache_Helper.saveData(
                      key: 'token', value: state.loginModel!.data!.token)
                  .then((value) {
                if (value == true) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShopLayout()),
                      (route) => false);
                }
              });
            } else {
              showToast(
                  text: state.loginModel!.message.toString(),
                  state: ToastState.error);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Login now to browse our hot offers',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.grey,
                                    )),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: const Icon(Icons.email),
                            label: const Text('Email'),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscureText: LoginCubit.get(context).isSecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: LoginCubit.get(context).isSecure
                                ? IconButton(
                                    icon: const Icon(Icons.visibility_outlined),
                                    onPressed: () =>
                                        LoginCubit.get(context).visable())
                                : IconButton(
                                    icon: const Icon(Icons.visibility_off),
                                    onPressed: () =>
                                        LoginCubit.get(context).visable()),
                            label: const Text('Password'),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          builder: (context) => TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.white,
                                minimumSize: const Size(double.infinity, 50)),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          condition: state is! LoginLoadingState,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Do\'nt have an account ?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
