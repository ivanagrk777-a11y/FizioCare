import 'package:flutter/material.dart';
import 'package:fiziocare/services/assets_manager.dart';
import 'package:fiziocare/widgets/subtitle_text.dart';
import 'package:fiziocare/widgets/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("${AssetsManager.imagePath}/logo.png"),
          ),
          title: const Text("FizioCare - Profil"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TitlesTextWidget(
                      label: "Prijavite se za pristup svim funkcijama"),
                ),
              ),
              Visibility(
                visible: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.surface,
                              width: 3),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitlesTextWidget(label: "Ivana Grk"), // Prilagođeno tebi!
                          SizedBox(height: 6),
                          SubtitleTextWidget(label: "ivana.fiziocare@gmail.com")
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: 5),
                    const TitlesTextWidget(label: "Opšte"),
                    const SizedBox(height: 10),
                    CustomListTile(
                        imagePath:
                            "${AssetsManager.imagePath}/bag/checkout.png",
                        text: "Moji termini", // Prilagođeno umjesto narudžbina
                        function: () {}),
                    CustomListTile(
                        imagePath:
                            "${AssetsManager.imagePath}/bag/wishlist.png",
                        text: "Omiljene vježbe", // Prilagođeno umjesto wishlist-e
                        function: () {}),
                    CustomListTile(
                        imagePath:
                            "${AssetsManager.imagePath}/profile/repeat.png",
                        text: "Istorija terapija",
                        function: () {}),
                    CustomListTile(
                      imagePath: "${AssetsManager.imagePath}/address.png",
                      text: "Adresa ordinacije",
                      function: () {},
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      thickness: 2,
                    ),
                    const TitlesTextWidget(label: "Podešavanja"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.login),
                  label: const Text("Odjava"),
                ),
              )
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.function});
  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(imagePath, height: 34),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}