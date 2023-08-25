import 'package:e_commerce_app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AppCubit.get(context).getAllProducts();
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}
