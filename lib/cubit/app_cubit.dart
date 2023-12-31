
import 'package:e_commerce_app/Models/Products_model.dart';
import 'package:e_commerce_app/Services/Dio/DioHelper.dart';
import 'package:e_commerce_app/cubit/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  List<ProductModel>? allProducts;
  void getAllProducts() {
    emit(GetAllProductsLoading());
    DioHelper.getData(endPoint: "products").then((value) {
      allProducts = <ProductModel>[];
      value.data.forEach(
        (e) => allProducts!.add(
          ProductModel.fromJson(e),
        ),
      );
      print(allProducts![1].id);
      emit(GetAllProductsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllProductsError());
    });
  }

  List<dynamic>? allcategories;
  void getAllCategories() {
    emit(GetAllCategoriesLoading());
    DioHelper.getData(endPoint: "products/categories").then((value) {
      allcategories = value.data;
      print(allcategories);
      emit(GetAllCategoriesSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllCategoriesError());
    });
  }

  List<ProductModel>? categoriesProducts;
  void getCategoriesProducts(String name) {
    emit(GetCategoriesProductsLoading());
    DioHelper.getData(endPoint: "products/category/$name").then((value) {
      value.data.forEach(
        (e) => categoriesProducts!.add(
          ProductModel.fromJson(e),
        ),
      );
      emit(GetCategoriesProductsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesProductsError());
    });
  }

  void addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) {
    emit(AddProductLoading());
    DioHelper.postData(endPoint: "products", data: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    }).then((value) {
      emit(AddProductSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AddProductError());
    });
  }

  void editProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) {
    emit(EditProductLoading());
    DioHelper.putData(endPoint: "products/$id", data: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    }).then((value) {
      emit(EditProductSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(EditProductError());
    });
  }
}
