part of 'app_cubit.dart';


abstract class AppStates {}

class AppInitial extends AppStates {}

class GetAllProductsLoading extends AppStates{}

class GetAllProductsSuccess extends AppStates{}

class GetAllProductsError extends AppStates{}