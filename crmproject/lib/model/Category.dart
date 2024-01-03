class Category {
  int? id;
  String? projectName;
  String? status;
  int? companyId;
  String? description;
  int? refId;

  Category(
      {this.id,
        this.projectName,
        this.status,
        this.companyId,
        this.description,
        this.refId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    projectName = json['ProjectName'];
    status = json['Status'];
    companyId = json['CompanyId'];
    description = json['Description'];
    refId = json['RefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ProjectName'] = this.projectName;
    data['Status'] = this.status;
    data['CompanyId'] = this.companyId;
    data['Description'] = this.description;
    data['RefId'] = this.refId;
    return data;
  }
}