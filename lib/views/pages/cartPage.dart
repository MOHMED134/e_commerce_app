import 'package:flutter/material.dart';


class cartProductPage extends StatefulWidget {
  const cartProductPage({super.key});

  @override
  State<cartProductPage> createState() => _cartProductPageState();
}

class _cartProductPageState extends State<cartProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined)),
      ),
      body:Center(child: Text('your cart is Empty')),
    );
  }
}
