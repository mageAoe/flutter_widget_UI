import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
        children: [
          const SizedBox(height: 25),
          // shop name
          Text('SUSHI MAN', 
            style: GoogleFonts.dmSerifDisplay(fontSize: 28,color: Colors.white)
          ),
          const SizedBox(height: 25),
          // icon
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset('lib/images/sushi_one.png'),
          )
          // title

          // subtitle

          // get started button
        ],
      ),
      )
    );
  }
}