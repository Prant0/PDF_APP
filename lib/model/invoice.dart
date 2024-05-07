
import 'package:pdf_app/model/customer.dart';
import 'package:pdf_app/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;
  final Quotation ?quotation;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
    this.quotation,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {

  final String? description,partNo;

  final int? quantity, itemNo;
  final double ?unitPrice,netPrice;

  const InvoiceItem({
      this.description,
    this.itemNo,this.netPrice,this.partNo,

      this.quantity,

      this.unitPrice,
  });
}


class Quotation{
  final String ?quotationNumber,fileName,customerName,quotationDetails,client,attentionOf,correspondingAddress,siteName,quoteDate,quoteNumber,jobDescription,jobLocation,name,position,signed,purchedOrderNumber,date;
    Quotation({this.quotationDetails,this.fileName,this.customerName,this.name,this.position,this.date,this.attentionOf,this.client,this.correspondingAddress,this.jobDescription,this.jobLocation,this.purchedOrderNumber,this.quoteDate,this.quotationNumber,this.quoteNumber,this.signed,this.siteName, });


}