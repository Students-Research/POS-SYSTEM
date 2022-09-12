class InvoicesBody {
  List<InvoiceBody>? body;

  InvoicesBody({this.body});

  InvoicesBody.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <InvoiceBody>[];
      json['body'].forEach((v) {
        body!.add(new InvoiceBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceBody {
  int? id;
  String? totalAmount;
  String? discount;
  String? netAmount;
  String? balance;
  String? paidAmount;
  String? userId;
  String? customerId;
  String? createdAt;
  String? updatedAt;

  InvoiceBody(
      {this.id,
      this.totalAmount,
      this.discount,
      this.netAmount,
      this.balance,
      this.paidAmount,
      this.userId,
      this.customerId,
      this.createdAt,
      this.updatedAt});

  InvoiceBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['total_amount'];
    discount = json['discount'];
    netAmount = json['net_amount'];
    balance = json['balance'];
    paidAmount = json['paid_amount'];
    userId = json['user_id'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_amount'] = this.totalAmount;
    data['discount'] = this.discount;
    data['net_amount'] = this.netAmount;
    data['balance'] = this.balance;
    data['paid_amount'] = this.paidAmount;
    data['user_id'] = this.userId;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
