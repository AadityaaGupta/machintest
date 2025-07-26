import 'package:machinetest2/model/ProductModel.dart';

abstract class HomeScreenState{}

class HomeScreenInitial extends HomeScreenState {}  
class HomeScreenLoading extends HomeScreenState {}
class HomeScreenLoaded extends HomeScreenState {
  final ProductModel products;

  HomeScreenLoaded(this.products);
}
class HomeScreenError extends HomeScreenState {
  final String message;

  HomeScreenError(this.message);
}