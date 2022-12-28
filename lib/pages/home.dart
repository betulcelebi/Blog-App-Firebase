import 'dart:ui';

import 'package:firebase_login/controller/home_controller.dart';
import 'package:firebase_login/pages/blog.dart';
import 'package:firebase_login/routes/app_routes.dart';
import 'package:firebase_login/shared/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseService db = DatabaseService();
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text(controller.deger),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xffEFEFEF), // Status bar
        ),
        elevation: 0,
        backgroundColor: const Color(0xffEFEFEF),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/menu.png"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset("assets/notification.png"),
          )
        ],
      ),
      backgroundColor: const Color(0xffEFEFEF),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 350,
                height: 42,
                //color: Colors.amber,
                child: Row(
                  children: [
                    Container(
                      width: 280,
                      height: 42,
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Search",
                                style: TextStyle(
                                    color: Color(0xffC8C8C8), fontSize: 17),
                              ),
                              Image.asset("assets/search.png")
                            ]),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 40,
                      // ignore: sort_child_properties_last
                      child: Image.asset("assets/filter.png"),
                      decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(4)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 600,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.liste.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8, right: 10),
                        width: 350,
                        height: 264,
                        decoration: BoxDecoration(
                            color: const Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.liste[index]["title"],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 22,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/pr.png"),
                                      radius: 10,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      controller.liste[index]["author"],
                                      style: const TextStyle(
                                          color: Color(0xff000000), fontSize: 12),
                                    ),
                                    const SizedBox(width: 14),
                                    Image.asset("assets/ellipse.png"),
                                    const SizedBox(width: 16),
                                    const Text(
                                      "Jul 29, 2022",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12,
                                          color: Color(0xffC8C8C8)),
                                    ),
                                    const SizedBox(width: 16),
                                    Image.asset("assets/ellipse.png"),
                                    const SizedBox(width: 16),
                                    const Text("4 min. read",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 12,
                                            color: Color(0xffC8C8C8))),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 7),
                              Container(
                                width: 350,
                                height: 1,
                                color: const Color(0xffC8C8C8),
                              ),
                              const SizedBox(height: 14),
                              SizedBox(
                                //color: Colors.red,
                                width: 341,
                                height: 90,
                                child: Text.rich(TextSpan(
                                    style: GoogleFonts.montserrat(fontSize: 12),
                                    text: controller.liste[index]["content"])),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                  alignment: Alignment.center,
                                  width: 344,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: InkWell(
                                    onTap: () {
                                      controller.deleteItem(controller.liste[index].id);
                                      // controller.analyticsService.logEvent();
                                      },
                                    child: Text("Read more",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.BLOG);
            
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
