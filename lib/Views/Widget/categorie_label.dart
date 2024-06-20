import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/ViewModel/categories_view_model.dart';
import 'package:provider/provider.dart';

import '../../Model/categorie.dart';

class CategorieLabel extends StatefulWidget {

  const CategorieLabel({super.key, required this.model, required this.onTap});
  final Categorie model;
  final VoidCallback onTap;
  @override
  CategorieLabelState createState() => CategorieLabelState();
}

class CategorieLabelState extends State<CategorieLabel> {

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: widget.model.isSelected ? 0 : 1,
                  color: widget.model.isSelected ? Colors.transparent : ColorConstant.gray),
              borderRadius: BorderRadius.circular(100),
            ),
            color: widget.model.isSelected ? ColorConstant.lightMaroon : ColorConstant.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: widget.model.isSelected ? ColorConstant.red : ColorConstant.gray,
                  fontSize: 16
              ),
              duration: const Duration(seconds: 1),
              child: Text(widget.model.name)
          ),
        ),
      ),
    );
  }
}