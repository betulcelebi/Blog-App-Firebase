import 'package:firebase_login/bindings/login_binding.dart';
import 'package:firebase_login/controller/register_controller.dart';
import 'package:firebase_login/pages/login.dart';
import 'package:firebase_login/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/textfield.dart';

class RegisterPage extends GetView<RegisterController> {
  // var registerCtrl = Get.find<RegisterController>();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset("assets/unlock.png")),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  onChanged: (value) => controller.email = value,
                  hintText: 'E-mail',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // password textfield
                MyTextField(
                  onChanged: (value) => controller.password = value,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                InkWell(
                  onTap: () {
                    controller.authService
                        .createUser(controller.email, controller.password);

                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 130),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
