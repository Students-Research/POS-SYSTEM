class SingleInvoicesBody {
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
  List<SoldProduct>? soldProduct;

  SingleInvoicesBody(
      {this.id,
      this.totalAmount,
      this.discount,
      this.netAmount,
      this.balance,
      this.paidAmount,
      this.userId,
      this.customerId,
      this.createdAt,
      this.updatedAt,
      this.soldProduct});

  SingleInvoicesBody.fromJson(Map<String, dynamic> json) {
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
    if (json['sold_product'] != null) {
      soldProduct = <SoldProduct>[];
      json['sold_product'].forEach((v) {
        soldProduct!.add(new SoldProduct.fromJson(v));
      });
    }
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
    if (this.soldProduct != null) {
      data['sold_product'] = this.soldProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SoldProduct {
  int? id;
  String? saleId;
  String? productId;
  String? quantity;
  Products? products;

  SoldProduct(
      {this.id, this.saleId, this.productId, this.quantity, this.products});

  SoldProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleId = json['sale_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_id'] = this.saleId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? productName;
  String? s_price;

  Products({this.id, this.productName, this.s_price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    s_price = json['s_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['s_price'] = this.s_price;
    return data;
  }
}
