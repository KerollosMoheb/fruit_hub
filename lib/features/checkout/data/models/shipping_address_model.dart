import 'package:fruits_e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? phone;
  String? address;
  String? name;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
    this.floor,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      phone: entity.phone,
      address: entity.address,
      name: entity.name,
      city: entity.city,
      email: entity.email,
      floor: entity.floor,
    );
  }

  @override
  String toString() {
    return '$address $floor $city';
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'floor': floor,
      'city': city,
      'email': email,
    };
  }
}
