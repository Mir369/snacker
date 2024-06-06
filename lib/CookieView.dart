import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/Cookie.dart';
import 'package:go_router/go_router.dart';

class CookieViewPage extends StatefulWidget {
  const CookieViewPage({super.key, required this.cookie});

  final Cookie cookie;

  @override
  State<CookieViewPage> createState() => _CookieViewPageState();
}

class _CookieViewPageState extends State<CookieViewPage> {
  late List<bool> checked = List.filled(widget.cookie.instructions.length, false);

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 238, 244), 
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 10, 25),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          ),
        ),
        title: Text(
          widget.cookie.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        leading: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                  });
                },
              ),
              items: widget.cookie.images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Ingredients:',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.cookie.ingredients
                    .map((str) => Text(
                          '-   $str',
                          style: const TextStyle(
                              fontFamily: 'OpenSans', fontSize: 20),
                        ))
                    .toList(),
              ),
            ),
            Text(
              'Instructions:',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.cookie.instructions
                    .map((str) => Text(
                          '>   $str',
                          style: const TextStyle(
                              fontFamily: 'OpenSans', fontSize: 20),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
