import 'package:flutter/material.dart';
import 'package:machinetest2/model/ProductModel.dart';

class CartScreen extends StatefulWidget {
  List<Products>? products;
   CartScreen({super.key,this.products});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Cart Screen',
          ),
          
          Container(
            child: ListView.builder(
              itemCount: widget.products?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(widget.products![index].title ?? 'Product ${index + 1}'),
                      subtitle: Text('Price: \$${widget.products![index].price}'),
                      leading: Image.network(widget.products![index].image ?? ''),
                      
                    ),
                    const SizedBox(width: 5),
                    Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          setState(() {
                            
                          });
                        }, child: Text("+"))
                      ],

                    )
                     // Assuming quantity is 1 for simplicity
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}