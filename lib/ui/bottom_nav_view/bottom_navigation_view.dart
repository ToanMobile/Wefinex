import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefinex/ui/favourite/favourite_binding.dart';
import 'package:wefinex/ui/favourite/favourite_screen.dart';
import 'package:wefinex/ui/home/home_screen.dart';
import 'package:wefinex/ui/search/search_binding.dart';
import 'package:wefinex/ui/search/search_screen.dart';
import 'package:wefinex/ui/topcoin/topcoin_binding.dart';
import 'package:wefinex/ui/topcoin/topcoin_screen.dart';

import 'bottom_navigation_view_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BottomNavigationView extends GetView<BottomNavigationViewController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            Common().string.title_app,
            style: TextStyle(color: Colors.black),
          ),
        ),*/
        bottomNavigationBar: Obx(() => Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.lightBlue,
                backgroundColor: Colors.white,
                elevation: 15.0,
                currentIndex: controller.currentNavPageIndex,
                onTap: (index) {
                  controller.currentNavPageIndex = index;
                },
                items: controller.bottomNavigationBarItems,
              ),
            )),
        body: SafeArea(
          child: Obx(
            () {
              if (controller.currentNavPageIndex == 1) {
                Get.find<SearchController>().onInit();
              } else if (controller.currentNavPageIndex == 2) {
                Get.find<TopCoinController>().onInit();
              } else if (controller.currentNavPageIndex == 3) {
                Get.find<FavouriteController>().onInit();
              }
              return IndexedStack(
                index: controller.currentNavPageIndex,
                children: [
                  HomeScreen(),
                  TopCoinScreen(),
                  SearchScreen(),
                  FavouriteScreen(),
                ],
              );
            },
          ),
        ),
      );
}
