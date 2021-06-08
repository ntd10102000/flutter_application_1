// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_lab_3/models/supplier.dart';
// import 'package:localstore/localstore.dart';

// class NewSupplierPage extends StatefulWidget {
//   @override
//   _NewSupplierPageState createState() => _NewSupplierPageState();
// }

// class _NewSupplierPageState extends State<NewSupplierPage> {
//   final _db = Localstore.instance;
//   final _titleKey = GlobalKey<FormFieldState>();
//   final _addressKey = GlobalKey<FormFieldState>();
//   final _phoneNumberKey = GlobalKey<FormFieldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New supplier'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextFormField(
//               key: _titleKey,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             TextFormField(
//               key: _addressKey,
//               decoration: InputDecoration(
//                 labelText: 'Address',
//               ),
//             ),
//             TextFormField(
//               key: _phoneNumberKey,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone number',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final id = _db.collection('supplier').doc().id;
//                 final item = Supplier(
//                   id: id,
//                   title: _titleKey.currentState!.value,
//                   address: _addressKey.currentState!.value,
//                   phoneNumber: _phoneNumberKey.currentState!.value,
//                 );
//                 item.save();
//                 Navigator.pop(context);
//               },
//               child: Text('Add'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
