import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/constant.dart';
import 'package:food_delivery_app/view/widgets/food_category_card.dart';
import 'package:food_delivery_app/view/widgets/popular_food_card.dart';

import '../utils/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedFoodCard = 0;

  void _onCategorySelect(int index) {
    setState(() {
      selectedFoodCard = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 5, top: 5),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/man.jpeg'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/menu.svg',
                width: 15,
                height: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: PrimaryText(
                      text: 'Food',
                      size: 22,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: PrimaryText(
                      text: 'Delivery',
                      height: 1.1,
                      size: 42,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColors.secondary,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: AppColors.lighterGray,
                            ),
                          ),
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                            color: AppColors.lightGray,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: PrimaryText(
                      text: 'Categories',
                      fontWeight: FontWeight.w700,
                      size: 22,
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodCategoryList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 25 : 0,
                        ),
                        child: FoodCategoryCard(
                          imagePath: foodCategoryList[index]['imagePath']!,
                          name: foodCategoryList[index]['name']!,
                          index: index,
                          selectedFoodCard: selectedFoodCard,
                          onSelect: _onCategorySelect,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                    ),
                    child: PrimaryText(
                      text: 'Popular',
                      fontWeight: FontWeight.w700,
                      size: 22,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      popularFoodList.length,
                      (index) => PopularFoodCard(
                        imagePath: popularFoodList[index]['imagePath']!,
                        name: popularFoodList[index]['name']!,
                        weight: popularFoodList[index]['weight']!,
                        star: popularFoodList[index]['star']!,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
