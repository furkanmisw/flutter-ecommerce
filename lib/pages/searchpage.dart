import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  var back;
  SearchPage(this.back, {Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Color grey = const Color.fromARGB(255, 180, 180, 180);
  final double size = 26;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(children: [
              GestureDetector(
                onTap: () => widget.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(width: 20),
              const Expanded(
                  child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
              const Spacer(),
              Hero(tag: 'mic', child: Icon(Icons.mic, color: grey, size: size)),
              const SizedBox(width: 10),
              Hero(
                  tag: 'camera',
                  child: Icon(Icons.camera_alt, color: grey, size: size)),
            ]),
          ),
        )
      ]),
    );
  }
}
