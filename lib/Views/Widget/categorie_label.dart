import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';

class CategorieLabel extends StatefulWidget {

  const CategorieLabel({super.key, required this.label});
  final String label;
  @override
  CategorieLabelState createState() => CategorieLabelState();
}

class CategorieLabelState extends State<CategorieLabel> {
  bool _isSelected = true;

  Color _colorText = Colors.black;
  Color _colorBackground = Colors.white;
  Color _colorBorder = Colors.transparent;
  double _width = 0;

  CategorieLabelState();

  void toggleSelection(){
    setState(() {
      _isSelected = !_isSelected;

      if(_isSelected){
        _colorText = ColorConstant.red;
        _colorBackground = ColorConstant.lightMaroon;
        _colorBorder = Colors.transparent;
        _width = 0;
      }
      else {
        _colorText = ColorConstant.darkGray;
        _colorBackground = ColorConstant.white;
        _colorBorder = ColorConstant.gray;
        _width = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: _width, color: _colorBorder),
            borderRadius: BorderRadius.circular(100),
          ),
          color: _colorBackground
      ),
      child: GestureDetector(
        onTap: toggleSelection,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: AnimatedDefaultTextStyle(
              style: TextStyle(color: _colorText, fontSize: 16),
              duration: const Duration(seconds: 1),
              child: Text(widget.label)
          ),
        ),
      ),
    );
  }
}