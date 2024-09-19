import 'package:flutter/material.dart';
import 'screens/board_screen.dart';
import 'screens/splash_screen.dart'; 

void main() {
  runApp(const OXAPP());
}

class OXAPP extends StatelessWidget {
  const OXAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName, 
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        BoardScreen.routeName: (_) => BoardScreen(),
      },
    );
  }
}
