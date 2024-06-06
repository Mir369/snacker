import 'package:flutter/material.dart';
import 'package:flutter_application_2/AIPage.dart';
import 'package:flutter_application_2/Cookie.dart';
import 'package:flutter_application_2/CookieView.dart';
import 'package:flutter_application_2/MapPage.dart';
import 'package:flutter_application_2/homepage.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';


List<CameraDescription>? camera;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Snacker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: routeMap,
      debugShowCheckedModeBanner: false,
    );
  }
}

final routeMap = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage()
    ),
    GoRoute(
      path: '/AI',
      builder: (context, state) => const UI()
    ),
    GoRoute(
      path: '/Map',
      builder: (context, state) => const MapUI()
    ),
    GoRoute(
      path: '/recipe',
      builder: (context, state) => CookieViewPage(
        cookie: state.extra as Cookie,
    ),
    )
  ]
);
