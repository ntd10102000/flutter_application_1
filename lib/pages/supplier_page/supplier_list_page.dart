// import 'package:flutter/material.dart';
// import 'package:localstore/localstore.dart';

// import '../../models/supplier.dart';
// import './new_supplier_page.dart';
// import './edit_supplier_page.dart';

// class SupplierListPage extends StatefulWidget {
//   @override
//   _SupplierListPageState createState() => _SupplierListPageState();
// }

// class _SupplierListPageState extends State<SupplierListPage> {
//   final _db = Localstore.instance;
//   final _items = <String, Supplier>{};

//   @override
//   void initState() {
//     _db.collection('supplier').stream.listen((event) {
//       setState(() {
//         final item = Supplier.fromMap(event);
//         _items.putIfAbsent(item.id, () => item);
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Supplier list'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => NewSupplierPage()));
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: _items.entries.length,
//         itemBuilder: (context, index) {
//           final key = _items.keys.elementAt(index);
//           final item = _items[key]!;
//           return Card(
//             child: ListTile(
//               title: Text('${item.title}'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('${item.address}'),
//                   Text('${item.phoneNumber}'),
//                   Text('${item.id}'),
//                 ],
//               ),
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.delete,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     item.delete();
//                     _items.remove(key);
//                   });
//                 },
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.edit),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => EditSupplierPage(supplier: item)));
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
