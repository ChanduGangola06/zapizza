import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zapizza/views/widgets/categories_list.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoriesList(
              title: "All",
              image:
                  "https://w7.pngwing.com/pngs/686/527/png-transparent-fast-food-hamburger-sushi-pizza-fast-food-food-breakfast-fast-food-restaurant-thumbnail.png",
              onTap: () {},
              selected: true,
            ),
            CategoriesList(
              title: "Pizza",
              image:
                  "https://img.freepik.com/free-psd/pictou-county-pizza-isolated-transparent-background_191095-32844.jpg?w=740&t=st=1708363021~exp=1708363621~hmac=77bfa11247729048f2f1825a4d134e6e0e9e485adefac878e8e3010a02f00008",
              onTap: () {},
            ),
            CategoriesList(
                title: "Burger",
                image:
                    "https://img.freepik.com/free-psd/fresh-beef-burger-isolated-transparent-background_191095-9023.jpg?size=626&ext=jpg&ga=GA1.1.353227389.1708363008&semt=sph",
                onTap: () {}),
            CategoriesList(
              title: "Pizza",
              image:
                  "https://img.freepik.com/free-psd/pictou-county-pizza-isolated-transparent-background_191095-32844.jpg?w=740&t=st=1708363021~exp=1708363621~hmac=77bfa11247729048f2f1825a4d134e6e0e9e485adefac878e8e3010a02f00008",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
