import 'package:db_miner/Controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    Get.put(QuoteController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Liked Qoutes"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
