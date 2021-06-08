// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_lab_3/models/supplier.dart';
// import 'package:localstore/localstore.dart';

// class EditSupplierPage extends StatefulWidget {
//   final Supplier supplier;

//   const EditSupplierPage({
//     Key? key,
//     required this.supplier,
//   }) : super(key: key);

//   @override
//   _EditSupplierPageState createState() =>
//       _EditSupplierPageState(supplier: this.supplier);
// }

// class _EditSupplierPageState extends State<EditSupplierPage> {
//   Supplier supplier;
//   final _db = Localstore.instance;
//   final _titleKey = GlobalKey<FormFieldState>();
//   final _addressKey = GlobalKey<FormFieldState>();
//   final _phoneNumberKey = GlobalKey<FormFieldState>();

//   _EditSupplierPageState({required this.supplier});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit supplier'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextFormField(
//               key: _titleKey,
//               initialValue: supplier.title,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             TextFormField(
//               key: _addressKey,
//               initialValue: supplier.address,
//               decoration: InputDecoration(
//                 labelText: 'Address',
//               ),
//             ),
//             TextFormField(
//               key: _phoneNumberKey,
//               keyboardType: TextInputType.phone,
//               initialValue: supplier.phoneNumber,
//               decoration: InputDecoration(
//                 labelText: 'Phone number',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 supplier.title = _titleKey.currentState!.value;
//                 supplier.address = _addressKey.currentState!.value;
//                 supplier.phoneNumber = _phoneNumberKey.currentState!.value;

//                 supplier.save();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Update'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
