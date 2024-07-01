import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';
import 'package:flymenu/Model/selectable.dart';

import '../../Model/categorie.dart';

class SelectableLabel extends StatefulWidget {

  const SelectableLabel({super.key, required this.selectable, this.onTap});
  final Selectable selectable;
  final VoidCallback? onTap;
  @override
  SelectableLabelState createState() => SelectableLabelState();
}

class SelectableLabelState extends State<SelectableLabel> {

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: widget.selectable.isSelected ? 0 : 1,
                  color: widget.selectable.isSelected ? Colors.transparent : ColorConstant.gray),
              borderRadius: BorderRadius.circular(100),
            ),
            color: widget.selectable.isSelected ? ColorConstant.lightMaroon : ColorConstant.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: widget.selectable.isSelected ? ColorConstant.red : ColorConstant.gray,
                  fontSize: 16
              ),
              duration: const Duration(seconds: 1),
              child: Text(widget.selectable.name)
          ),
        ),
      ),
    );
  }
}