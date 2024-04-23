import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ordering/modules/auth/servies/auth_services.dart';

import 'package:food_ordering/modules/auth/widget/form_button.dart';
import 'package:food_ordering/utils/constant.dart';
import 'package:food_ordering/utils/theme.dart';
import '../model/user.dart';
import '../providers/authProvider.dart';
import '../widget/form_field.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String routerName = '/signUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      password = TextEditingController(),
      username = TextEditingController(),
      name = TextEditingController(),
      confirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalBox(30),

                  const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  const Text(
                    "Login with your account using email and password",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  verticalBox(30),
                  MyTextField(
                      type: TextInputType.text,
                      controller: username,
                      label: "Username",
                      hint: "ac_d"),
                  verticalBox(20),
                  MyTextField(
                      type: TextInputType.text,
                      controller: name,
                      label: "Name",
                      hint: "Abc"),
                  verticalBox(20),
                  MyTextField(
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      label: "Email",
                      hint: "Abc@gmail.com"),
                  verticalBox(20),
                  MyTextField(
                    type: TextInputType.visiblePassword,
                    controller: password,
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
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalBox(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have acoount\t|",
                        style: TextStyle(fontSize: 14),
                      ),
                      horizontalBox(10),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          "SignIn",
                          style: TextStyle(
                              color: Colors.red,
                              fontStyle: FontStyle.italic,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  verticalBox(20),
                  Consumer(builder: (context, ref, child) {
                    return FormButton(
                        text: "Submit",
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            ref.read(isSignLoad.notifier).state = true;
                            User user = User(
                                name: name.text,
                                password: password.text,
                                confirmPassword: confirmPassword.text,
                                username: username.text,
                                email: emailController.text);
                            if(await AuthService().signUp(user)){
                              showToast("SignUp Successfully", context);
                              Navigator.pop(context);
                            }

                          }
                        });
                  }),
                  verticalBox(15),
                  Consumer(builder: (context, ref, child) {
                    return ref.watch(isSignLoad)
                        ? const CircularProgressIndicator(color: Colors.red)
                        : const Center();
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
