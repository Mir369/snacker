import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cookie.dart';
import 'package:flutter_application_2/CookieTypes.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Widget _buildCategoryCard(BuildContext context, String title, String route, Color startColor, Color endColor, String imagepath, Color textColor) { //helps with making the two icons for map and ai areas
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor]),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
          image: DecorationImage(
                image: AssetImage(imagepath), // Assuming imagePath is a property of Cookie
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 238, 244), //making it a differnt color instead of white lol

       appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Increase the height of the AppBar
        child: AppBar(
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.all(1.0), // Adjust padding as needed
              child: Container(
        width: 350,
        height: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
                image: AssetImage('assests/logo.png'), // Assuming imagePath is a property of Cookie
                fit: BoxFit.cover,
              ),
        ),), // Adjust the height of the image
            ),
          ),
          backgroundColor: Color.fromARGB(255, 1, 10, 25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),

        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildCategoryCard(context, 'Map', '/Map', Colors.blue, Colors.lightBlueAccent, 'assests/map.png', Colors.white),
                  _buildCategoryCard(context, 'Cookie AI Detector', '/AI', Colors.lightBlueAccent, Colors.blue,'assests/ai.jpg', Color.fromARGB(255, 255, 255, 255)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: FoodItemsGrid(cookies: CookieTypes.cookies),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItemsGrid extends StatelessWidget { //borrowing this from my groups app for Recipwee -SHOUOUT TO BRYAN!!! this saved me so much time
  const FoodItemsGrid({super.key, required this.cookies});

  final List<Cookie> cookies;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 206, 238, 244),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: cookies.length,
        itemBuilder: (context, idx) {
          return GestureDetector(
            onTap: () {
              context.push('/recipe', extra: cookies[idx]);
              print('$idx');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(cookies[idx].images[0]), // Assuming imagePath is a property of Cookie
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  cookies[idx].name,
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}