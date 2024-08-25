import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';

class FoodCategoryCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int index;
  final int selectedFoodCard;
  final ValueChanged<int> onSelect;

  const FoodCategoryCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.index,
    required this.selectedFoodCard,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedFoodCard == index ? AppColors.primary : AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.lighterGray,
              blurRadius: 15,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
              onPressed: null,
              fillColor: selectedFoodCard == index
                  ? AppColors.white
                  : AppColors.tertiary,
              shape: const CircleBorder(),
              child: Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: selectedFoodCard == index ? AppColors.black : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
