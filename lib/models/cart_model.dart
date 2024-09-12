import 'package:e_commerce/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(productes) {
    var quantity = {};
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  //getter for subtotal price
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  // function for delivery price
  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0;
    } else {
      return 10;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add\$${missing.toStringAsFixed(2)} for FREE delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  //getter for totalSring

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  //getter for FreeDeliveryString

  String get freeDeliveryString => freeDelivery(subtotal);

  // getter for subTotalString
  String get subTotalString => subtotal.toStringAsFixed(2);

  // getter for delivery FeeString
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
