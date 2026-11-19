import 'package:flutter/material.dart';
import 'package:fiziocare/consts/app_colors.dart';
import 'package:fiziocare/widgets/subtitle_text.dart';
import 'package:fiziocare/widgets/title_text.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onPressed,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 230,
        ),
        Image.asset(
          imagePath,
          width: double.infinity,
          height: size.height * 0.20,
        ),
        const SizedBox(
          height: 20,
        ),
        TitlesTextWidget(
          label: title,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SubtitleTextWidget(
              label: subtitle,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.lightCardColor,
          ),
          onPressed: onPressed ?? () {},
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}