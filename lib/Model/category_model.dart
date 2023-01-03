class CategoryModel {
  String? categoryid;
  String? name;
  String? isparent;
  String? createdon;
  String? isdelete;
  String? isactive;
  String? imgurl;

  CategoryModel(
      {this.categoryid,
      this.name,
      this.isparent,
      this.createdon,
      this.isdelete,
      this.isactive,
      this.imgurl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryid = json['categoryid'];
    name = json['name'];
    isparent = json['isparent'];
    createdon = json['createdon'];
    isdelete = json['isdelete'];
    isactive = json['isactive'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryid'] = this.categoryid;
    data['name'] = this.name;
    data['isparent'] = this.isparent;
    data['createdon'] = this.createdon;
    data['isdelete'] = this.isdelete;
    data['isactive'] = this.isactive;
    data['imgurl'] = this.imgurl;
    return data;
  }
}
