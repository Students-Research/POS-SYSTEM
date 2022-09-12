class LogInDataBody {
  List<LogInBody>? body = [];

  LogInDataBody({this.body});

  LogInDataBody.fromJson(json) {
    if (json != null) {
      json.forEach((v) {
        body?.add(LogInBody.fromJson(v));
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

class LogInBody {
  int? id;
  String? name;
  String? companyName;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? totalInvoices;
  int? totalAmount;
  List<Customers>? customers = [];

  LogInBody(
      {this.id,
      this.name,
      this.companyName,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.totalInvoices,
      this.totalAmount,
      this.customers});

  LogInBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyName = json['company_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalInvoices = json['Total_invoices'] ?? 0;
    totalAmount = json['Total_amount'] ?? 0;
    if (json['customers'] != null) {
      json['customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Total_invoices'] = this.totalInvoices;
    data['Total_amount'] = this.totalAmount;
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  int? id;
  String? name;
  String? email;
  String? address;
  String? contact;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Customers(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.contact,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Customers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    contact = json['contact'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
