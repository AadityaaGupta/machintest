import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest2/Blocs/home_screen_bloc/home_screen_event.dart';
import 'package:machinetest2/Blocs/home_screen_bloc/home_screen_state.dart';
import 'package:machinetest2/model/ProductModel.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent,HomeScreenState>{
  HomeScreenBloc() : super(HomeScreenInitial()) {
   getProductList();
  }



  getProductList() async {
    try {
      emit(HomeScreenLoading());
      // Simulate fetching data
      ProductModel productData;
      final response =  await http.get(Uri.parse("https://fakestoreapi.in/api/products"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      productData = ProductModel.fromJson(data);
      print("Token from main method------>>>>>>${data.toString()}");
     emit(HomeScreenLoaded(productData));
    } else {
      throw Exception('Failed to fetch token');
    }
    } catch (e) {
      emit(HomeScreenError(e.toString()));
    }
  }
}