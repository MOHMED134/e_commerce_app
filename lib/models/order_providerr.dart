import 'package:final_project/models/product.dart';

class OrderItem{
   int? quantity;
   int? uId;
   double? price;
   Product? product;

   OrderItem();

  OrderItem.fromJson(Map<String , dynamic>data){
    uId = data['uId'];
    quantity = data['quantity'];
    price = data['price'];
    product = Product.fromJson(data['product']);
  }
  Map<String , dynamic> toJson(){
    return {
      "uId" : uId,
      "quantity" : quantity,
      "price" : price,
      "product" : product?.toJson(),
    };
  }
}