import 'package:flutter/material.dart';
import 'package:flymenu/ViewModel/categories_view_model.dart';
import 'package:flymenu/ViewModel/products_view_model.dart';
import 'package:flymenu/Views/Widget/categorie_label.dart';
import 'package:flymenu/Views/Widget/element_list_widget.dart';
import 'package:flymenu/Views/Widget/product_widget.dart';
import 'package:provider/provider.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Menu',
                            style: Theme.of(context).primaryTextTheme.titleLarge,
                          ),
                        ),
                        Text(
                          'Lorem ipsum sit dolore amet et saepe adrium venit. Lorem ipsum sit dolore amet et saepe adrium venit.',
                          softWrap: true,
                          style: Theme.of(context).primaryTextTheme.bodySmall,
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
                                        itemCount: viewModel.categoriesService.categories.collection.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return
                                            SelectableLabel(
                                                selectable: viewModel.categoriesService.categories.collection[index],
                                                onTap: () {
                                                  viewModel.onItemChange(index);
                                                });
                                        },
                                    ),
                                  ),
                                  Text(
                                    viewModel.categorieText,
                                    style: Theme.of(context).primaryTextTheme.labelSmall,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Consumer<ProductsViewModel>(
                      builder: (context, viewModel, child) {
                        return ListView.builder(
                          itemCount: viewModel.products.collection.length,
                          itemBuilder: (BuildContext context, int index){
                            var product = viewModel.products.collection[index];
                            return ListTile(
                              title: ElementListWidget(product: product),
                              onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProductWidget(product: product))
                                  ),
                              },
                            );
                          },
                        );
                      }
                    ),
                  ),
                ),
              ],
            )
        ),
    );
  }
}