import 'package:cedihub/home_page.dart';
import 'package:cedihub/models.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.ease);
    _animationController!.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage(models: Models());
        },
      ));
      // Navigate to the home screen or the next screen
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.amber.withOpacity(0.7),
          //     Colors.red.withOpacity(0.7),
          //   ],
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.topRight,
          // ),
          ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 47, 109, 49),
        body: FadeTransition(
          opacity: _animation!,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/cedihub_logo 2.png",
                    fit: BoxFit.contain,
                    scale: 10,
                  ),
                ),
                // SizedBox(height: 10),
                // Text("CEDI HUB",
                //     style: const TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.black,
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
