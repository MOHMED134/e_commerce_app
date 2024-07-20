import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

class product_page extends StatefulWidget {
  final Product product;
  const product_page({required this.product, super.key});

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  int counter = 1;

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
     await Future.delayed(Duration(seconds: 1));

    counter = Provider.of<CartProvider>(context, listen: false)
        .getItemQuantity(widget.product.id ?? 0)!;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.cart),
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  height: 250,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: widget.product.image ?? '',
                    placeholder: (context, url) =>
                    const SizedBox(
                        height: 15,
                        width: 15,
                        child: FittedBox(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              '${widget.product.title}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25),
                            )),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.favorite_border,
                              size: 30,
                              color: Colors.green,
                            )),
                      ],
                    ),
                    Text(
                      '1pice, Priceg',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (counter == 1) {
                                return print('please chose countity');
                              } else {
                                counter--;
                              }
                            });
                          },
                          icon: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(CupertinoIcons.minus)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          counter.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                          },
                          icon: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(CupertinoIcons.plus)),
                        ),
                        Spacer(),
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            '\$ ${widget.product.price! * counter}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Nutritions',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            width: 50,
                            height: 20,
                            child: Center(child: Text('100gm'))),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Review',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Spacer(),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.deepOrange,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.deepOrange,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.deepOrange,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.deepOrange,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Colors.deepOrange,
                        ),
                        Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrangeAccent,
                                foregroundColor: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Add to cart'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   void addItemToCart() {
//     Provider.of<CartProvider>(context, listen: false)
//         .addProductToCart(widget.product, counter);
//   }
// }
