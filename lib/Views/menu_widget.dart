import 'package:darq/darq.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/Model/categorie.dart';
import 'package:flymenu/ViewModel/categories_view_model.dart';
import 'package:flymenu/ViewModel/menu_viewmodel.dart';
import 'package:flymenu/ViewModel/products_view_model.dart';
import 'package:flymenu/Views/Widget/categorie_label.dart';
import 'package:flymenu/Views/Widget/element_list_widget.dart';
import 'package:provider/provider.dart';

import '../Model/menu.dart';
import '../Repository/Datas/memory_data.dart';

class MenuWidget extends StatefulWidget {

  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final MemoryData memoryData = MemoryData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  const Color(0xFFF4F5F5),
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiGsqX_Vkvwmiy5V7GowCVKpcFTHSLebHAmA&s"),
                        fit: BoxFit.fill,
                      ),
                      color: Color(0x7F30363D),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F5),
                    border: Border.all(color: const Color(0x00000000)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              color: Color(0xFF30363D),
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.48,
                            ),
                          ),
                        ),
                        const Text(
                          'Lorem ipsum sit dolore amet et saepe adrium venit. Lorem ipsum sit dolore amet et saepe adrium venit.',
                          softWrap: true,
                          style: TextStyle(
                            color: Color(0x7F30363D),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.28,
                          ),
                        ),
                        Consumer<CategoriesViewModel>(
                            builder: (context, viewModel, child){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                SizedBox(
                                    height: 100,
                                    child:
                                      ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        itemCount: viewModel.categories.collection.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return
                                            CategorieLabel(
                                                model: viewModel.categories.collection[index],
                                                onTap: () {
                                                  viewModel.onItemChange(index);
                                                });
                                        },
                                    ),
                                  ),
                                  Text(
                                    viewModel.categorieText,
                                    style: const TextStyle(color: Colors.black87),
                                  ),
                                ],
                              );
                            }
                          )
                        ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Consumer<ProductsViewModel>(
                        builder: (context, viewModel, child) {
                          return ListView.builder(
                            itemCount: viewModel.products.collection.length,
                            itemBuilder: (BuildContext context, int index){
                              return ElementListWidget(product: viewModel.products.collection[index]);
                            },
                          );
                        }
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
    );
  }
}