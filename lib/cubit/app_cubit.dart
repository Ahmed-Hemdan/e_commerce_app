import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Models/Products_model.dart';
import 'package:e_commerce_app/Services/Dio/DioHelper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  ProductModel? allProducts;
  void getAllProducts() {
    emit(GetAllProductsLoading());
    DioHelper.getData(endPoint: "products").then((value) {
      allProducts = ProductModel.fromJson(value.data);
      emit(GetAllProductsSuccess());
    }).catchError((error) {
      emit(GetAllProductsError());
    });
  }

  List<dynamic>? allcategories;
  void getAllCategories() {
    emit(GetAllCategoriesLoading());
    DioHelper.getData(endPoint: "categories").then((value) {
      allcategories = value.data;
      emit(GetAllCategoriesSuccess());
    }).catchError((error) {
      emit(GetAllCategoriesError());
    });
  }
}
