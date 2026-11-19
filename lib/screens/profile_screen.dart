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
                  label: "Prijavite se za pristup svim funkcijama",
                ),
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
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            "${AssetsManager.imagePath}/avatar.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitlesTextWidget(label: "Ivana Grk"),
                          SizedBox(height: 6),
                          SubtitleTextWidget(label: "ivana.fiziocare@gmail.com"),
                        ],
                      ),
                    ),
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
                    icon: Icons.calendar_month_outlined,
                    text: "Moji termini",
                    function: () {},
                  ),
                  CustomListTile(
                    icon: Icons.favorite_border,
                    text: "Omiljene vježbe",
                    function: () {},
                  ),
                  CustomListTile(
                    icon: Icons.history,
                    text: "Istorija terapija",
                    function: () {},
                  ),
                  CustomListTile(
                    icon: Icons.location_on_outlined,
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
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
  });

  final IconData icon;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      leading: Icon(icon, size: 28),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}