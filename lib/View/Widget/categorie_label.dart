import 'package:flutter/material.dart';
import 'package:flymenu/Helper/colors_constante.dart';

class CategorieLabel extends StatefulWidget {

  const CategorieLabel({super.key});

  @override
  CategorieLabelState createState() => CategorieLabelState();
}

class CategorieLabelState extends State<CategorieLabel> {
  bool _isSelected = true;

  Color _colorText = Colors.black;
  Color _colorBackground = Colors.grey;
  Color _colorBorder = Colors.transparent;
  double _width = 0;

  String label = "Hello world";

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
      height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: _width, color: _colorBorder),
            borderRadius: BorderRadius.circular(100),
          ),
          color: _colorBackground
      ),
      child: IntrinsicWidth(
        child: GestureDetector(
          onTap: toggleSelection,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                  style: TextStyle(color: _colorText, fontSize: 14),
                  duration: const Duration(seconds: 1),
                  child: Text(label)
              ),
            ],
          ),
        ),
      ),
    );
  }
}