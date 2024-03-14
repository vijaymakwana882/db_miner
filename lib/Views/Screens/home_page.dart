import 'package:db_miner/Controllers/api_controller.dart';
import 'package:db_miner/Views/Screens/favorite_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final QuoteController _quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Favorite());
            },
            icon: Icon(Icons.favorite),
          )
        ],
        title: Text('Quotes'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _quoteController.quotes.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                Get.toNamed(
                  "/details",
                  arguments: index,
                );
              },
              title: Text(_quoteController.quotes[index]['content']),
              subtitle: Text(_quoteController.quotes[index]['author']),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  _quoteController.likeQuote(index);
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _quoteController.refreshQuotes();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
