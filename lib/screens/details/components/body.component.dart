import 'package:app_1/constants.dart';
import 'package:app_1/models/product.model.dart';
import 'package:app_1/screens/details/components/productTitleWithImage.component.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                    top: size.height * 0.12, left: kDefaultPadding),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Color'),
                            ColorsToSelect(),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              ProductTitleWithImage(product: product)
            ],
          ),
        )
      ]),
    );
  }
}

class ColorsToSelect extends StatefulWidget {
  const ColorsToSelect({
    Key? key,
  }) : super(key: key);

  @override
  State<ColorsToSelect> createState() => _ColorsState();
}

class _ColorsState extends State<ColorsToSelect> {
  List<Color> colorsToSelect = [
    const Color(0xFF356C95),
    const Color(0xFFF8C978),
    const Color(0xFFA29B9B)
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorsToSelect.length,
          itemBuilder: (context, index) => buildDotColor(index)),
    );
  }

  Widget buildDotColor(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(
              top: kDefaultPadding / 4, right: kDefaultPadding / 2),
          padding: const EdgeInsets.all(2.5),
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: index == selectedIndex
                    ? colorsToSelect[index]
                    : Colors.transparent),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: colorsToSelect[index], shape: BoxShape.circle),
          ),
        ),
      );
}
