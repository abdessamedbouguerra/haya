import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import '../../layout/layoutScreen.dart';
import '../login/LoginCubit/LoginCubit.dart';
import '../login/LoginCubit/LoginStates.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var fullNameController = TextEditingController();
  var confirmPassController = TextEditingController();
  var passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFF46C2CB),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 25,
                left: 25,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // image
                    const Image(
                      image: AssetImage('assets/images/loginpic.png'),
                      height: 330,
                      width: 330,
                    ),
                    // login text
                    const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // login form
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // Name form field 
                          defultFormField(
                            controller: fullNameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                              return null;
                            },
                            textlabel: 'Full name',
                            prefixIcon: Icons.email,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // Email form field
                          defultFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email must not be empty';
                              }
                              return null;
                            },
                            textlabel: 'Email',
                            prefixIcon: Icons.email,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // PassWord form field
                          defultFormField(
                              controller: passWordController,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                }
                                return null;
                              },
                              textlabel: 'PassWord',
                              prefixIcon: Icons.lock,
                              suffixIcon: LoginCubit.get(context).suffix,
                              isPassWord: LoginCubit.get(context).isPassword,
                              onPressedSuffix: () {
                                LoginCubit.get(context).changeVisibility(
                                    LoginCubit.get(context).isPassword);
                              },
                              onFieldSubmitted: (value) {
                                if (formKey.currentState!.validate()) {
                                  navigateAndFinish(
                                      context, const LayoutScreen());
                                }
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // PassWord Confirm 
                          // Forget PassWord
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                child: const Text('Forget PassWord',
                                    style: TextStyle(
                                        color: Color(0xFF064492), fontSize: 14.0)),
                              ),
                            ],
                          ),

                          // Button submite
                          Container(
                            width: double.infinity,
                            height: 53.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: const Color(0xFFECFFFE),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  navigateAndFinish(
                                      context, const LayoutScreen());
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          // Creat acount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'You don\'t have acount ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                child: const Text('Creat acount',
                                    style: TextStyle(
                                        color: Color(0xFF064492), fontSize: 14.0)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
