import 'dart:ui';

import 'package:firebase_login/controller/blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BlogPage extends GetView<BlogController> {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEFEF),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xffEFEFEF), // Status bar
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEFEFEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                controller.Title.toString();
              },
              obscureText: false,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey[500])),
            ),
            SizedBox(height: 10),
            Container(
                height: MediaQuery.of(context).size.height *
                    0.3, //set the size according to your choice
                decoration: BoxDecoration(
                  //Customize your container
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "",
                      hintStyle: TextStyle(color: Colors.grey[500])),
                  maxLines: 25,
                )),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                controller.auth.addBlog(controller.Title, controller.content);
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Add Blog Post",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
