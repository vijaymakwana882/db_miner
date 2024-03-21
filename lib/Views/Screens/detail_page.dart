import 'package:db_miner/Controllers/quote_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    int quoteIndex = ModalRoute.of(context)!.settings.arguments as int;
    QuoteController quoteController = Get.put(QuoteController());


    bool isFavorite = quoteController.favoriteQuotes.contains(quoteController.quotes[quoteIndex]);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.back();
        },
        child: Icon(CupertinoIcons.back),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset("assets/images/detail_bg.png", fit: BoxFit.fitHeight),
          ),
          FadeTransition(
            opacity: _animation,
            child: GetBuilder<QuoteController>(
              builder:(controller) =>  Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quoteController.quotes[quoteIndex]['content'],
                      style: GoogleFonts.aboreto(textStyle: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "- ${quoteController.quotes[quoteIndex]['author']}",
                          style: GoogleFonts.lato(textStyle: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          )),
                        ),

                        IconButton(
                          icon: Icon(isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart),
                          color: isFavorite ? Colors.red : null,
                          onPressed: () {
                            if (isFavorite) {
                              quoteController.favoriteQuotes.remove(quoteController.quotes[quoteIndex]);
                            } else {
                              quoteController.addToFavorites(quoteIndex);
                            }
                          },
                        )

                      ],
                    ),
                    SizedBox(height: 24.0),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Tags:",
                      style:
                      GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children:
                      quoteController.quotes[quoteIndex]['tags'].map<Widget>((tag) => Chip(
                        label:
                        Text(tag, style:
                        GoogleFonts.poppins(),
                        ),
                        backgroundColor:
                        Color(0xff80D9EB),
                      )).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}