import 'package:ecommerce/Utils/api.dart';
import 'package:ecommerce/components/categoriescomponents.dart';
import 'package:ecommerce/globalstate.dart';
import 'package:ecommerce/model/categoriesModel.dart';
import 'package:ecommerce/model/categoryadatamodel.dart';
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

  List<CategoriesModel> categoriesData = [];
  List<CategoryDataModel> categoryItemsData = [];
  GlobalState globalState = Get.find();
  int selected = 0;
  int selectedCategorySub = 0;
  @override
  void initState() {
    super.initState();
    start();
  }

  Future<void> start() async {
    categoriesData = await Api.categoryNamesGet();
    selected = categoriesData.first.id;
    categoryItemsData = await Api.getCategoryData(selected);
    selectedCategorySub = categoryItemsData.first.id;
    setState(() {});
  }

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
                          SizedBox(
                            width: 90,
                            child: SingleChildScrollView(
                              child: Column(
                                  children: categoriesData
                                      .map(
                                        (e) => CategoryItem(
                                          e,
                                          (id) async {
                                            categoryItemsData =
                                                await Api.getCategoryData(id);
                                            selected = e.id;
                                            selectedCategorySub =
                                                categoryItemsData.first.id;
                                            setState(() {});
                                          },
                                          selected == e.id,
                                        ),
                                      )
                                      .toList()),
                            ),
                          ),
                          Expanded(
                        
                            child: SizedBox(
                              height: y,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: categoryItemsData
                                      .map(
                                        (data) => CategoriSubItem(data,
                                            selectedCategorySub == data.id,
                                            (xdd) {
                                          selectedCategorySub = xdd;
                                          setState(() {});
                                        }),
                                      )
                                      .toList(),
                                ),
                              ),
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
