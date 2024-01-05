class mainuser {
  int? id;
  String? heading;
  int? categoryId;
  int? companyId;
  bool? isActive;
  String? categoryName;
  String? cguid;
  int? refId;

  mainuser(
      {this.id,
        this.heading,
        this.categoryId,
        this.companyId,
        this.isActive,
        this.categoryName,
        this.cguid,
        this.refId});

  mainuser.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    heading = json['Heading'];
    categoryId = json['CategoryId'];
    companyId = json['CompanyId'];
    isActive = json['IsActive'];
    categoryName = json['CategoryName'];
    cguid = json['Cguid'];
    refId = json['RefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Heading'] = this.heading;
    data['CategoryId'] = this.categoryId;
    data['CompanyId'] = this.companyId;
    data['IsActive'] = this.isActive;
    data['CategoryName'] = this.categoryName;
    data['Cguid'] = this.cguid;
    data['RefId'] = this.refId;
    return data;
  }
}