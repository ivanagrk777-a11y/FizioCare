import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:fiziocare/consts/app_colors.dart';
import 'package:fiziocare/services/assets_manager.dart';
import 'package:fiziocare/widgets/products/product_widget.dart'; // Možeš kasnije preimenovati i u fizio_widget ili slično, ali za sad ostaje ista struktura

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("${AssetsManager.imagePath}/logo.png"),
            ),
            title: const Text("FizioCare - Pretraga")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: searchTextController,
                decoration: InputDecoration(
                  hintText: "Pretraži vježbe ili usluge...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      searchTextController.clear();
                    },
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.lightCardColor,
                    ),
                  ),
                ),
                onChanged: (value) {
                  // log("value of the text is $value");
                },
                onSubmitted: (value) {
                  // log("value of the text is $value");
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: DynamicHeightGridView(
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    builder: (context, index) {
                      return const ProductWidget();
                    },
                    itemCount: 10, // Možeš prilagoditi broj stavki po želji
                    crossAxisCount: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}