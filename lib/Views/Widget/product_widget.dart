import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/Model/volumetric.dart';
import 'package:flymenu/Views/Widget/happy_hour_widget.dart';
import 'package:flymenu/Views/menu_widget.dart';

import '../../Model/boisson.dart';
import '../../Model/categorie.dart';
import '../../Model/product.dart';
import 'categorie_label.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                widget.product.imagePath,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.product.isHappyHour,
                      child: Row(
                        children: [
                          HappyHourWidget(isVisible: widget.product.isHappyHour),
                          const Text(" -10%"),
                        ],
                      ),
                    ),
                    Text(widget.product.title, style: Theme.of(context).primaryTextTheme.titleLarge),
                    Text(widget.product.description, style: Theme.of(context).textTheme.bodyLarge),
                    if(widget.product is Boisson)...[
                      Container(
                        decoration: const ShapeDecoration(
                          color: ColorConstant.gray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Taille", style: Theme.of(context).primaryTextTheme.labelLarge),
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (widget.product as Boisson).volumetrie.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var boisson = widget.product as Boisson;
                                    return
                                      SelectableLabel(
                                          selectable: boisson.volumetrie[index],
                                              onTap: () => {
                                                  setState(() {
                                                    for(var volume in boisson.volumetrie){
                                                      volume.isSelected = volume == boisson.volumetrie[index];
                                                    }
                                                  })
                                              },
                                      );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: widget.product.isHappyHour && widget.product.percentageReduce != null ,
                                child: Text(
                                  "${widget.product.price} €",
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: ColorConstant.gray,
                                  ),
                                ),
                              ),
                              Text("${widget.product.price * widget.product.getPercentage()}€ TTC", style: Theme.of(context).primaryTextTheme.labelMedium),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                              backgroundColor: const Color(0xFF217FB4),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (context) => const MenuWidget()
                                  )
                              ),
                            },
                            child: Text("Ajouter au panier + ", style: Theme.of(context).primaryTextTheme.titleMedium),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}