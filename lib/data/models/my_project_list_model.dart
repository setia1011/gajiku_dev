class MyProjectsListModel {
  int? id;
  String? project;
  String? address;
  String? responsibleName;
  int? responsibleIdType;
  String? responsibleIdNumber;
  int? userId;
  int? creator;
  String? createdAt;
  int? editor;
  String? updatedAt;

  MyProjectsListModel(
      {this.id,
      this.project,
      this.address,
      this.responsibleName,
      this.responsibleIdType,
      this.responsibleIdNumber,
      this.userId,
      this.creator,
      this.createdAt,
      this.editor,
      this.updatedAt});

  MyProjectsListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    project = json['project'];
    address = json['address'];
    responsibleName = json['responsible_name'];
    responsibleIdType = json['responsible_id_type'];
    responsibleIdNumber = json['responsible_id_number'];
    userId = json['user_id'];
    creator = json['creator'];
    createdAt = json['created_at'];
    editor = json['editor'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['project'] = project;
    data['address'] = address;
    data['responsible_name'] = responsibleName;
    data['responsible_id_type'] = responsibleIdType;
    data['responsible_id_number'] = responsibleIdNumber;
    data['user_id'] = userId;
    data['creator'] = creator;
    data['created_at'] = createdAt;
    data['editor'] = editor;
    data['updated_at'] = updatedAt;
    return data;
  }
}
