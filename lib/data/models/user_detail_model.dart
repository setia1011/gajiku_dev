class UserDetailModel {
  String? email;
  String? address;
  String? name;
  String? status;
  int? groupId;
  int? creator;
  String? createdAt;
  int? idType;
  int? editor;
  String? username;
  String? idNumber;
  String? updatedAt;
  int? id;
  String? phone;
  RefGroup? refGroup;
  RefIdType? refIdType;
  List<RefProject>? refProject;

  UserDetailModel(
      {this.email,
        this.address,
        this.name,
        this.status,
        this.groupId,
        this.creator,
        this.createdAt,
        this.idType,
        this.editor,
        this.username,
        this.idNumber,
        this.updatedAt,
        this.id,
        this.phone,
        this.refGroup,
        this.refIdType,
        this.refProject});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    address = json['address'];
    name = json['name'];
    status = json['status'];
    groupId = json['group_id'];
    creator = json['creator'];
    createdAt = json['created_at'];
    idType = json['id_type'];
    editor = json['editor'];
    username = json['username'];
    idNumber = json['id_number'];
    updatedAt = json['updated_at'];
    id = json['id'];
    phone = json['phone'];
    refGroup = json['ref_group'] != null
        ? RefGroup.fromJson(json['ref_group'])
        : null;
    refIdType = json['ref_id_type'] != null
        ? RefIdType.fromJson(json['ref_id_type'])
        : null;
    if (json['ref_project'] != null) {
      refProject = <RefProject>[];
      json['ref_project'].forEach((v) {
        refProject!.add(RefProject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['address'] = address;
    data['name'] = name;
    data['status'] = status;
    data['group_id'] = groupId;
    data['creator'] = creator;
    data['created_at'] = createdAt;
    data['id_type'] = idType;
    data['editor'] = editor;
    data['username'] = username;
    data['id_number'] = idNumber;
    data['updated_at'] = updatedAt;
    data['id'] = id;
    data['phone'] = phone;
    if (refGroup != null) {
      data['ref_group'] = refGroup!.toJson();
    }
    if (refIdType != null) {
      data['ref_id_type'] = refIdType!.toJson();
    }
    if (refProject != null) {
      data['ref_project'] = refProject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RefGroup {
  String? id;
  String? groupDescription;
  String? groupName;

  RefGroup({this.id, this.groupDescription, this.groupName});

  RefGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupDescription = json['group_description'];
    groupName = json['group_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['group_description'] = groupDescription;
    data['group_name'] = groupName;
    return data;
  }
}

class RefIdType {
  int? id;
  String? idType;
  String? idDescription;

  RefIdType({this.id, this.idType, this.idDescription});

  RefIdType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idType = json['id_type'];
    idDescription = json['id_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['id_type'] = idType;
    data['id_description'] = idDescription;
    return data;
  }
}

class RefProject {
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

  RefProject(
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

  RefProject.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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