class Subcategory {
  int? id;
  String? categoryName;
  String? projectName;
  bool? isActive;
  int? companyID;
  int? projectID;
  String? cguid;
  int? refId;

  Subcategory(
      {this.id,
        this.categoryName,
        this.projectName,
        this.isActive,
        this.companyID,
        this.projectID,
        this.cguid,
        this.refId});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    categoryName = json['CategoryName'];
    projectName = json['ProjectName'];
    isActive = json['IsActive'];
    companyID = json['CompanyID'];
    projectID = json['ProjectID'];
    cguid = json['Cguid'];
    refId = json['RefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CategoryName'] = this.categoryName;
    data['ProjectName'] = this.projectName;
    data['IsActive'] = this.isActive;
    data['CompanyID'] = this.companyID;
    data['ProjectID'] = this.projectID;
    data['Cguid'] = this.cguid;
    data['RefId'] = this.refId;
    return data;
  }
}