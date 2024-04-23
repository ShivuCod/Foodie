import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/modules/auth/page/signUp.dart';
import 'package:food_ordering/modules/auth/providers/authProvider.dart';
import 'package:food_ordering/modules/auth/servies/auth_services.dart';
import 'package:food_ordering/modules/auth/widget/form_button.dart';
import 'package:food_ordering/modules/home/page/bottomTabs.dart';
import 'package:food_ordering/utils/constant.dart';
import 'package:food_ordering/utils/theme.dart';

import '../widget/form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routerName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
verticalBox(200),
                    const Text(
                      "Welcome back",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      "Login with your account using email and password",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    verticalBox(30),
                    MyTextField(
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        label: "Email",
                        hint: "Abc@gmail.com"),
                    verticalBox(20),
                    MyTextField(
                      controller: password,
                      type: TextInputType.visiblePassword,
                      label: "Password",
                      hint: "Pass@123",
                      isObscure: true,
                    ),
                    verticalBox(20),
                    MyTextField(
                      controller: confirmPassword,
                      type: TextInputType.visiblePassword,
                      label: "Confirm Password",
                      hint: "Pass@123",
                      isObscure: true,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Please fill the form";
                        } else if (password.text != confirmPassword.text) {
                          return "Incorrect password";
                        }else{
                          return null;
                        }
                      },
                    ),
                    verticalBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Did'nt have acoount\t|",
                          style: TextStyle(fontSize: 14),
                        ),
                        horizontalBox(10),
                        GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, SignUp.routerName),
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                    verticalBox(20),
                    Consumer(builder: (context, ref, child) {
                      return FormButton(
                          text: "Submit",
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              ref.read(isLoginLoad.notifier).state =
                                  true;
                              if(await AuthService().login(emailController.text, password.text)){
                                Navigator.popAndPushNamed(context, ScreenModel.routerName);
                              }

                              ref.read(isLoginLoad.notifier).state =
                              false;
                            }
                          });
                    }),
                    verticalBox(15),
                    Consumer(builder: (context, ref, child) {
                      return ref.watch(isLoginLoad) == true
                          ? CircularProgressIndicator(color: Colors.red)
                          : Center();
                    })
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
