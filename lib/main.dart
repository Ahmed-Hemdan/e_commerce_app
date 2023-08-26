import 'package:e_commerce_app/Screens/Home.dart';
import 'package:e_commerce_app/Services/Dio/DioHelper.dart';
import 'package:e_commerce_app/cubit/app_cubit.dart';
import 'package:e_commerce_app/cubit/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllProducts(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          initialRoute: "/",
          routes: {
            "/": (context) => const HomeScreen(),
          },
          title: 'e-commerce app',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
