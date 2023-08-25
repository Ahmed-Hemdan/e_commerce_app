import 'package:e_commerce_app/Components/Custom_Card_Component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.cartShopping,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          "New Tren",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 13.w, left: 13.w, top: 65.h),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.35,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 75.h,
            ),
            itemCount: 15,
            itemBuilder: (context, index) => const CustomCard()),
      ),
    );
  }
}
