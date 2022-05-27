import 'package:ecommerce/globalstate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesHeader extends StatelessWidget {
  GlobalState globalState = Get.find();

  final Color grey = const Color.fromARGB(255, 180, 180, 180);
  final double size = 26;

  CategoriesHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: GestureDetector(
            onTap: () => globalState.categoryPageLvl.value = 'search',
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: grey, size: size),
                    const SizedBox(width: 8),
                    Text(
                      'Ürün,kategori veya marka ara',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    const Spacer(),
                    Hero(
                        tag: 'mic',
                        child: Icon(Icons.mic, color: grey, size: size)),
                    const SizedBox(width: 10),
                    Hero(
                        tag: 'camera',
                        child: Icon(Icons.camera_alt, color: grey, size: size)),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
