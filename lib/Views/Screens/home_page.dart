import 'package:db_miner/Controllers/quote_controller.dart';
import 'package:db_miner/Views/Screens/favorite_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final QuoteController _quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    int page = 1;
    return Scaffold(

      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xff80D9EB),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Favorite());
            },
            icon: Icon(Icons.favorite_outline_rounded),
          )
        ],
        title: Text('Quotes'),
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: _quoteController.quotes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 4 / 2),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF8D0D0),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/ltq2.png"),
                ),
              ),
              child: Center(
                child: Container(
                  width: 300,
                  child: ListTile(
                    onTap: () {
                      Get.toNamed("/details", arguments: index);
                    },
                    title: Text(
                      _quoteController.quotes[index]['content'],
                      maxLines: 4,
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(fontSize: 18)),
                    ),
                    subtitle: Text(
                      _quoteController.quotes[index]['author'],

                      style: GoogleFonts.poppins( textStyle: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 4,
        onPressed: () {

          page++;
          _quoteController.refreshQuotes(page);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
