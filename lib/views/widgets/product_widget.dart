import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/views/pages/product_Page.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({
    required this.product,
    super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => product_page(product: product))),
      child: Column(

        children: [
          Row(
            children: [
              Container(
                width: 150,
                height: 250,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(onTap: () {}, child: Icon(Icons.favorite_border)),
                      ],
                    ),
                    Expanded(
                        child: CachedNetworkImage(

                      imageUrl: product.image ?? '',
                      placeholder: (context, url) => const SizedBox(
                          height: 15,
                          width: 15,
                          child: FittedBox(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.title ?? 'no title',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '1 pice , Priceg',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(

                              '\$ ${product.price ?? 'no price'}',

                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                print('hello');
                              },
                              icon: Icon(Icons.add),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        spreadRadius: 4.0,
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
