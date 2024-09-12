part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? mail;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;
  final Checkout checkout;

  CheckoutLoaded(
      {this.fullName,
      this.mail,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.subtotal,
      this.deliveryFee,
      this.total,
      this.products})
      : checkout = Checkout(
          fullName: fullName,
          mail: mail,
          address: address,
          city: city,
          country: country,
          zipCode: zipCode,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
          products: products,
        );

  List<Object?> get props => [
        fullName,
        mail,
        address,
        city,
        country,
        zipCode,
        subtotal,
        deliveryFee,
        total,
        products,
      ];
}
