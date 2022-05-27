import 'package:ecommerce/components/CategoriesComponents.dart';
import 'package:ecommerce/globalstate.dart';
import 'package:ecommerce/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void back() {
    globalState.categoryPageLvl.value = 'category';
  }

  GlobalState globalState = Get.find();
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (globalState.categoryPageLvl.value == 'search') {
          back();
          return false;
        } else {
          return true;
        }
      },
      child: Obx(
        () => globalState.categoryPageLvl.value == 'category'
            ? SizedBox(
                width: x,
                height: y,
                child: Column(
                  children: [
                    CategoriesHeader(),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            color: Colors.blue,
                          ),
                          Expanded(
                            child: Container(
                              width: 30,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : SearchPage(() => back()),
      ),
    );
  }
}
