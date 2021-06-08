import 'dart:convert';

import 'package:localstore/localstore.dart';

class Supplier {
  String id;
  String title;
  String address;
  String phoneNumber;

  Supplier({
    required this.id,
    required this.title,
    required this.address,
    required this.phoneNumber,
  });

//</editor-fold>

  Supplier copyWith({
    String? id,
    String? title,
    String? address,
    String? phoneNumber,
  }) {
    return Supplier(
      id: id ?? this.id,
      title: title ?? this.title,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id'],
      title: map['title'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Supplier.fromJson(String source) =>
      Supplier.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Supplier(id: $id, title: $title, address: $address, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Supplier &&
        other.id == id &&
        other.title == title &&
        other.address == address &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode;
  }
}

extension ExtSupplier on Supplier {
  Future save() async {
    final db = Localstore.instance;
    return db.collection('supplier').doc(id).set(toMap());
  }

  Future delete() async {
    final db = Localstore.instance;
    return db.collection('supplier').doc(id).delete();
  }
}
