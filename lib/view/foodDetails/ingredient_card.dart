import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      margin: const EdgeInsets.only(
        right: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey[300]!,
            ),
          ]),
      child: Image.asset(
        imagePath,
        width: 50,
      ),
    );
  }
}
