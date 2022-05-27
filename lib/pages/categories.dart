import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final Color grey = const Color.fromARGB(255, 180, 180, 180);
  final double size = 26;
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return SizedBox(
      width: x,
      height: y,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
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
                    Icon(Icons.mic, color: grey, size: size),
                    const SizedBox(width: 5),
                    Icon(Icons.camera_alt, color: grey, size: size),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
