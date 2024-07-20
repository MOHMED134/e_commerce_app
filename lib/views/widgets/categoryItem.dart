import 'package:final_project/providers/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  const CategoryItem({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context,ProductProvider productProvider, Widget? child) {

      return   InkWell(
          onTap: () => productProvider.onChangeCategory(categoryName),
          child: Container(
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),

              color:
              productProvider.selectedCategory == categoryName ?
              Colors.orangeAccent : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child:

              Icon(getIcon(),
                  color:
                  productProvider.selectedCategory == categoryName ?
                  Colors.white : Colors.black),
            ),
          ),
        );

      },
    );
  }

  IconData getIcon() {
    switch (categoryName) {
      case 'electronics':
        return LineAwesome.laptop_solid;
      case 'jewelery':
        return LineAwesome.gem;
      case 'men\'s clothing':
        return LineAwesome.tshirt_solid;
        case 'women\'s clothing':
          return Icons.woman;
      default:
        return Icons.no_backpack;

    }
  }
}
