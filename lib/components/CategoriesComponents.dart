import 'package:ecommerce/globalstate.dart';
import 'package:ecommerce/model/categoriesModel.dart';
import 'package:ecommerce/model/categoryadatamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesHeader extends StatelessWidget {
  GlobalState globalState = Get.find();

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
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Image.asset(
                        'assets/icons/search.png',
                        width: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ürün,kategori veya marka ara',
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    const Spacer(),
                    Hero(
                      tag: 'mic',
                      child: Image.asset(
                        'assets/icons/mic.png',
                        width: 14,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Hero(
                      tag: 'camera',
                      child: Image.asset(
                        'assets/icons/camera.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoriesModel data;
  var set;
  bool selected;

  CategoryItem(this.data, this.set, this.selected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      child: GestureDetector(
        onTap: () => set(data.id),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected ? Colors.orange.shade700 : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              child: Column(children: [
                Image.network(data.iconUrl.replaceAll('{size}', '50-50')),
                const Spacer(flex: 2),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey[700],
                  ),
                ),
                const Spacer(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriSubItem extends StatefulWidget {
  CategoryDataModel data;
  bool open;
  var otherClose;
  CategoriSubItem(this.data, this.open, this.otherClose, {Key? key})
      : super(key: key);

  @override
  State<CategoriSubItem> createState() => _CategoriSubItemState();
}

class _CategoriSubItemState extends State<CategoriSubItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.data.children.isEmpty) {
          return;
          //
        }
        widget.open = !widget.open;
        widget.otherClose(widget.open ? widget.data.id : 0);
        setState(() {});
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  children: [
                    Text(
                      widget.data.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                        fontSize: widget.open ? 15 : 13,
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: widget.data.children.isNotEmpty,
                      child: Image.asset(
                        'assets/icons/${widget.open ? 'open' : 'close'}.png',
                        width: 20,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Visibility(
                visible: widget.open,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    children: widget.data.children
                        .map((data) => CategoryChildrenItems(data))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryChildrenItems extends StatelessWidget {
  var data;
  CategoryChildrenItems(this.data);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              data['iconUrl'].toString().replaceAll('{size}', '50-50'),
            ),
          ),
        ),
        Text(data['title'].toString()),
      ],
    );
  }
}
