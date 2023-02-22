// import 'package:generate_pdf_invoice_example/model/customer.dart';
// import 'package:generate_pdf_invoice_example/model/supplier.dart';

import 'Footer.dart';
import 'Header.dart';

// class Invoice {
//   final InvoiceInfo info;
//   final Supplier supplier;
//   final Customer customer;
//   final List<InvoiceItem> items;
//
//   const Invoice({
//     required this.info,
//     required this.supplier,
//     required this.customer,
//     required this.items,
//   });
// }
//
// class InvoiceInfo {
//   final String description;
//   final String number;
//   final DateTime date;
//   final DateTime dueDate;
//
//   const InvoiceInfo({
//     required this.description,
//     required this.number,
//     required this.date,
//     required this.dueDate,
//   });
// }
//
// class InvoiceItem {
//   final String description;
//   final DateTime date;
//   final int quantity;
//   final double vat;
//   final double unitPrice;
//
//   const InvoiceItem({
//     required this.description,
//     required this.date,
//     required this.quantity,
//     required this.vat,
//     required this.unitPrice,
//   });
// }

///////////////////////

class Invoice {
  final Header header;
  final Footer footer;
  final List<TableItemData> items;

  const Invoice({
    required this.header,
    required this.footer,
    required this.items
  });
}

class TableItemData {
  final String productName;
  final int productQuantity;
  final double productPrice;

  const TableItemData({
    required this.productName,
    required this.productQuantity,
    required this.productPrice,

  });
}
