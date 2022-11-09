import 'package:flutter/material.dart';
import 'package:flutter_basic_6/pages/login.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // todo Introduction Screen
        // page view 1
        PageViewModel(
          title: "Title of first page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            // todo Lottie animation
            child: Lottie.asset('assets/lotties/biker.json'),
          ),
        ),
        // page view 2
        PageViewModel(
          title: "Title of second page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child:
                // Image.network("https://picsum.photos/id/65/200/300",
                //     height: 175.0),
                Lottie.asset('assets/lotties/meditation.json'),
          ),
        ),

        // page view 3
        PageViewModel(
          title: "Title of third page",
          body:
              "Here you can write the description of the page, to explain someting...",
          image: Center(
            child:
                // Image.network("https://picsum.photos/id/91/200/300",
                //     height: 175.0),
                // todo Memberikan ukuran box pada image lottie
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Lottie.asset('assets/lotties/cat.json',
                        fit: BoxFit.contain)),
          ),
        ),
      ],
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        // When done button is press
        // todo Pindah screen ke LoginPage
        // pushReplacement pindah page tpi tdk bisa kembali ke screen awal
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      },
      showNextButton: true, // wajib ada
      next: const Text("Next >>"), // wajib ada
    ); //Material App
  }
}
