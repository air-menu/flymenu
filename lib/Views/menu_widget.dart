import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flymenu/Views/Widget/categorie_label.dart';
import 'package:flymenu/Views/Widget/element_list_widget.dart';

import '../Model/menu.dart';
import '../Repository/Datas/memory_data.dart';

class MenuWidget extends StatelessWidget {

  MenuWidget({super.key});

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
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: memoryData.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CategorieLabel(label: memoryData.categories[index].name);
                            },
                          ),
                        ),
                        const Text("Bières"),
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
                      child: ListView.builder(
                        itemCount: memoryData.products.length,
                        itemBuilder: (BuildContext context, int index){
                          return const ElementListWidget();
                        },
                      ),
                    ),
                  ),
                ),
            ],
        )
      )
    );
  }

}