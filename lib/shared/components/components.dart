import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';

Widget defaultButton({
  width = double.infinity,
  background = Colors.blue,
  double radius = 0.0,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
    );

// Widget defaultFormField({
//   required TextInputType type,
//   required String text,
//   required TextEditingController controller,
//   required IconData prefix,
//   required  VoidCallback validate,
// }) =>
//     TextFormField(
//       validator: validate,
//       controller: controller,
//       keyboardType: type,
//       // onFieldSubmitted: onSubmit,
//       decoration: InputDecoration(
//         labelText: text,
//         border: OutlineInputBorder(),
//         prefixIcon: Icon(prefix),
// // suffixIcon: Icon(Icons.email),
//       ),
//     );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

// void defaultTextButton(String text,Function function?){
//
//   TextButton(
//     onPressed: function,
//     child:Text(text) ,);
//}
class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

// Widget defaultTextButton({
//   required Function function,
//   required String text,
// }) => TextButton(onPressed: function, child: Text(text.toUpperCase(),
// ),);

// class CategoryWidget extends StatelessWidget {
//   final String CateTitle ;
//
//   const CategoryWidget({super.key,required this.CateTitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductProvider>(
//       builder: (BuildContext context, ProductProvider productProvider, Widget? child) {
//         return InkWell(
//           onTap: () {
//             productProvider.onChangeCategory(CateTitle);
//           },
//           child: OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                   backgroundColor: productProvider.selectedCategory == CateTitle?
//                   Colors.black:Colors.white
//               ),
//               onPressed: null,
//               child: Text(
//                 '${CateTitle}',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontFamily: 'Poppins',
//                     color: productProvider.selectedCategory == CateTitle?
//                     Colors.white:Colors.black,
//                     fontWeight: FontWeight.w600),
//               )),
//         );
//       },
//     );
//   }
//
// }



