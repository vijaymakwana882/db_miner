import 'package:db_miner/Views/Screens/detail_page.dart';
import 'package:db_miner/Views/Screens/favorite_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Views/Screens/home_page.dart';

void main() {
  runApp(DbMiner());
}

class DbMiner extends StatelessWidget {
  const DbMiner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quotes App",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/details", page: () => DetailPage()),
        GetPage(name: "/favorite", page: () => Favorite()),
      ],
    );
  }
}
