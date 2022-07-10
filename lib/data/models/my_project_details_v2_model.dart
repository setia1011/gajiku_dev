class MyProjectDetailsV2Model {
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
  RefIdType? refIdType;
  List<RefSubscription>? refSubscription;

  MyProjectDetailsV2Model(
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
    this.updatedAt,
    this.refIdType,
    this.refSubscription});

  MyProjectDetailsV2Model.fromJson(Map<String, dynamic> json) {
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
    refIdType = json['ref_id_type'] != null
        ? new RefIdType.fromJson(json['ref_id_type'])
        : null;
    if (json['ref_subscription'] != null) {
      refSubscription = <RefSubscription>[];
      json['ref_subscription'].forEach((v) {
        refSubscription!.add(new RefSubscription.fromJson(v));
      });
    }
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
    if (refIdType != null) {
      data['ref_id_type'] = refIdType!.toJson();
    }
    if (refSubscription != null) {
      data['ref_subscription'] =
          refSubscription!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['id_type'] = idType;
    data['id_description'] = idDescription;
    return data;
  }
}

class RefSubscription {
  int? id;
  int? subsPlanId;
  int? subsMonth;
  double? subsPrice;
  String? subsStart;
  String? subsEnd;
  String? token;
  int? projectId;
  String? status;
  int? creator;
  String? createdAt;
  int? editor;
  String? updatedAt;
  RefSubscriptionPlan? refSubscriptionPlan;

  RefSubscription(
    {this.id,
    this.subsPlanId,
    this.subsMonth,
    this.subsPrice,
    this.subsStart,
    this.subsEnd,
    this.token,
    this.projectId,
    this.status,
    this.creator,
    this.createdAt,
    this.editor,
    this.updatedAt,
    this.refSubscriptionPlan});

  RefSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subsPlanId = json['subs_plan_id'];
    subsMonth = json['subs_month'];
    subsPrice = json['subs_price'];
    subsStart = json['subs_start'];
    subsEnd = json['subs_end'];
    token = json['token'];
    projectId = json['project_id'];
    status = json['status'];
    creator = json['creator'];
    createdAt = json['created_at'];
    editor = json['editor'];
    updatedAt = json['updated_at'];
    refSubscriptionPlan = json['ref_subscription_plan'] != null
        ? new RefSubscriptionPlan.fromJson(json['ref_subscription_plan'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['subs_plan_id'] = subsPlanId;
    data['subs_month'] = subsMonth;
    data['subs_price'] = subsPrice;
    data['subs_start'] = subsStart;
    data['subs_end'] = subsEnd;
    data['token'] = token;
    data['project_id'] = projectId;
    data['status'] = status;
    data['creator'] = creator;
    data['created_at'] = createdAt;
    data['editor'] = editor;
    data['updated_at'] = updatedAt;
    if (refSubscriptionPlan != null) {
      data['ref_subscription_plan'] = refSubscriptionPlan!.toJson();
    }
    return data;
  }
}

class RefSubscriptionPlan {
  int? id;
  String? plan;
  double? monthlyPrice;
  String? status;
  int? creator;
  String? createdAt;
  int? editor;
  String? updatedAt;

  RefSubscriptionPlan(
    {this.id,
    this.plan,
    this.monthlyPrice,
    this.status,
    this.creator,
    this.createdAt,
    this.editor,
    this.updatedAt});

  RefSubscriptionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    monthlyPrice = json['monthly_price'];
    status = json['status'];
    creator = json['creator'];
    createdAt = json['created_at'];
    editor = json['editor'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['plan'] = plan;
    data['monthly_price'] = monthlyPrice;
    data['status'] = status;
    data['creator'] = creator;
    data['created_at'] = createdAt;
    data['editor'] = editor;
    data['updated_at'] = updatedAt;
    return data;
  }
}