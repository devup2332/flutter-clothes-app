import 'package:app_1/constants.dart';
import 'package:flutter/material.dart';

class Cathegories extends StatefulWidget {
  const Cathegories({super.key});

  @override
  State<Cathegories> createState() => _CathegoriesState();
}

class _CathegoriesState extends State<Cathegories> {
  List<String> cathegories = ['Hand Bag', 'Jewellery', 'Footwear', 'Dresses'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cathegories.length,
            itemBuilder: (context, index) => buildCathegory(index)),
      ),
    );
  }

  Widget buildCathegory(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cathegories[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        selectedIndex == index ? kTextColor : kTextLightColor),
              ),
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding / 4),
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
