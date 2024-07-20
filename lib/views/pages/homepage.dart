// import 'package:final_project/models/product.dart';
// import 'package:final_project/shared/styles/colors.dart';
// import 'package:final_project/views/pages/accountPage.dart';
// import 'package:final_project/views/pages/cartPage.dart';
// import 'package:final_project/views/pages/products_Screen.dart';
// import 'package:final_project/views/pages/show_proudcts.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common/sqlite_api.dart';
// import '../../providers/ProductProvider.dart';
// import 'explorePage.dart';
// import 'favouritePage.dart';
// import 'package:final_project/models/cart.dart';
//
// class HomeLayout extends StatefulWidget {
//   @override
//   State<HomeLayout> createState() => _HomeLayoutState();
// }
//
// class _HomeLayoutState extends State<HomeLayout> {
//
//   //
//   // List<Widget> screens = [
//   //   showProductPage(),
//   //   exploreProductPage(),
//   //   cartProductPage(),
//   //   favouriteProductPage(),
//   //   accountPage(),
//   // ];
//   // List<String> titles = [
//   //   'Shop',
//   //   'Explore',
//   //   'Cart',
//   //   'Favourite',
//   //   'Account',
//   // ];
//
//   @override
//   void initState() {
//     Provider.of<ProductProvider>(context,listen: false).getCategories();
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title: Text(
//           // titles[currentIndex],
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.add_shopping_cart,
//                     color: Colors.black,
//                   )),
//               Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Consumer<Cart>(
//                     builder: (context, cart, child) {
//                       return Text(
//                         "${cart.count}",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold),
//                       );
//                     },
//                   )),
//             ],
//           ),
//         ],
//       ),
//       // body: screens[currentIndex],
//
//
//
//     );
//   }
// }

import 'package:final_project/models/product.dart';
import 'package:final_project/providers/cart_provider.dart';
import 'package:final_project/shared/components/components.dart';
import 'package:final_project/views/widgets/ad_widget.dart';
import 'package:final_project/views/widgets/categoryItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../providers/ProductProvider.dart';
import '../widgets/TemplateWidget.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getCategories();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    Provider.of<ProductProvider>(context, listen: false).getCategories();
    Provider.of<CartProvider>(context, listen: false).getCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateWidget(
        bottomNavIndex: 0,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text(
                    'Shop',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [

                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: TextFormField(
                    // style: BorderRadius(),
                    decoration: InputDecoration(
                      hoverColor: Colors.red,
                      hintText: 'Search Store',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.grey),
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.grey, width: 4.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AdWidget(backgroundcolor: Colors.blue),
                      SizedBox(width: 15),
                      AdWidget(backgroundcolor: Colors.orange),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                getCategoryWidget(),
                SizedBox(height: 20),
                getProductsWidget(),
                SizedBox(height: 5),


                //  Product_view(Product(name: 'Chipsy', price: 15.25, no_: 5)),

                // screens[currentIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getProductsWidget(){

    if(Provider.of<ProductProvider>(context).products == null){
      return const CircularProgressIndicator.adaptive();
    }else if (Provider.of<ProductProvider>(context).products!.isNotEmpty){
      return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: Provider.of<ProductProvider>(context).products!.map((e) => ProductWidget(product: e)).toList(),
      );
    }else{
      return Text('No Products Founded');
    }
  }

  Widget getCategoryWidget() {
    if (Provider.of<ProductProvider>(context).categories == null) {
      return const CircularProgressIndicator.adaptive();
    } else if (Provider.of<ProductProvider>(context).categories!.isNotEmpty) {
      return SizedBox(
        height: 28,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: Provider.of<ProductProvider>(context)
              .categories!
              .map((e) => Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: CategoryItem(
                      categoryName: e,
                    ),
                  ))
              .toList(),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
