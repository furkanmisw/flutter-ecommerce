import 'package:ecommerce/pages/core.dart';
import 'package:flutter/material.dart';

class Ma extends StatelessWidget {
  const Ma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xfffafafa),
      ),
      home: const Core(),
    );
  }
}
