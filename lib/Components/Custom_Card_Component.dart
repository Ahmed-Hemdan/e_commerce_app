import 'package:e_commerce_app/Models/Products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
    ProductModel product;
   CustomCard({super.key , required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 100.h,
          width: 185.w,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    product.title.split(" ").first,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r"$""${product.price}"),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 75.h,
          right: 25.w,
          child: Image.network(
            product.image,
            height: 120,
            width: 100,
          ),
        ),
      ],
    );
  }
}
