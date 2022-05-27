import 'package:ecommerce/globalstate.dart';
import 'package:ecommerce/pages/categories.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/mycart.dart';
import 'package:ecommerce/pages/mylist.dart';
import 'package:ecommerce/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Core extends StatefulWidget {
  const Core({Key? key}) : super(key: key);

  @override
  State<Core> createState() => CoreState();
}

class CoreState extends State<Core> {
  GlobalState state = Get.put(GlobalState());
  final List<Widget> pages = const [
    Home(),
    Categories(),
    MyCart(),
    MyList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            children: pages,
            index: state.pageIndex.value,
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 56,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.orange[700],
              currentIndex: state.pageIndex.value,
              onTap: (newIndex) {
                state.categoryPageLvl.value = 'category';
                state.pageIndex.value = newIndex;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Anasayfam'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Kategorilerim'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Sepetim'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: 'Listelerim'),
              ]),
        ),
      ),
    );
  }
}
