import 'package:flutter/material.dart';
import 'package:fiziocare/widgets/subtitle_text.dart';
import 'package:fiziocare/widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlesTextWidget(label: "FizioCare"),
          SizedBox(height: 10),
          SubtitleTextWidget(label: "Vaš centar za fizioterapiju i oporavak"),
        ],
      ),
    ));
  }
}