import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetest2/Blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:machinetest2/Blocs/home_screen_bloc/home_screen_state.dart';
import 'package:machinetest2/Screens/cart_screen.dart';
import 'package:machinetest2/model/ProductModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color listTileColor = Colors.white;
  List<Products> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (BuildContext context) => HomeScreenBloc(),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeScreenLoaded) {
              return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'List of all the Products',
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: state.products.products!.length, // Example item count
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    if(products.contains(state.products.products![index])) {
                      products.remove(state.products.products![index]);
                      listTileColor = Colors.white;
                    } else {
                      products.add(state.products.products![index]);
                      listTileColor = Colors.blue[300]!;
                    }
                    listTileColor = Colors.blue[300]!;
                  });
                },
                child: ListTile(
                  focusColor: listTileColor,
                  title: Text(state.products.products![index].title ?? 'Product ${index + 1}'),
                  subtitle: Text(state.products.products![index].description ?? 'No description'),
                ),
              );
            },
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartScreen(products: products,)) );
          }, child: Text("Cart"))       ],
      );
            } else if (state is HomeScreenError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Welcome to the Home Screen'));
          },
        ),
      ),
      
      
      
     
    );
  }
}