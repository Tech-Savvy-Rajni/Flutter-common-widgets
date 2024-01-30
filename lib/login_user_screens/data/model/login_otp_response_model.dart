class OtpResponseModel {
  String? status;
  Data? data;
  String? message;

  OtpResponseModel({
    this.status,
    this.data,
    this.message,
  });

  OtpResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data?.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  int? userId;
  String? name;
  String? email;
  String? role;
  String? accessToken;
  String? deviceid;
  int? companyId;
  Notification? notification;
  Permissions? permissions;
  String? dob;
  String? joiningDate;
  String? designation;
  String? nextAppraisalDate;
  String? contact;
  String? bankName;
  String? branchName;
  String? accountNumber;
  String? accountHolderName;
  String? ifscCode;
  String? panNo;

  Data({
    this.userId,
    this.name,
    this.email,
    this.role,
    this.accessToken,
    this.deviceid,
    this.companyId,
    this.notification,
    this.permissions,
    this.dob,
    this.joiningDate,
    this.designation,
    this.nextAppraisalDate,
    this.contact,
    this.bankName,
    this.branchName,
    this.accountNumber,
    this.accountHolderName,
    this.ifscCode,
    this.panNo,
  });

  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    accessToken = json['access_token'];
    deviceid = json['deviceid'];
    companyId = json['company_id'];
    notification = Notification.fromJson(json['notification']);
    permissions = Permissions.fromJson(json['permissions']);
    dob = json['dob'];
    joiningDate = json['joining_date'];
    designation = json['designation'];
    nextAppraisalDate = json['next_appraisal_date'];
    contact = json['contact'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    accountNumber = json['account_number'];
    accountHolderName = json['account_holder_name'];
    ifscCode = json['ifsc_code'];
    panNo = json['pan_no'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['email'] = email;
    _data['role'] = role;
    _data['access_token'] = accessToken;
    _data['deviceid'] = deviceid;
    _data['company_id'] = companyId;
    _data['notification'] = notification?.toJson();
    _data['permissions'] = permissions?.toJson();
    _data['dob'] = dob;
    _data['joining_date'] = joiningDate;
    _data['designation'] = designation;
    _data['next_appraisal_date'] = nextAppraisalDate;
    _data['contact'] = contact;
    _data['bank_name'] = bankName;
    _data['branch_name'] = branchName;
    _data['account_number'] = accountNumber;
    _data['account_holder_name'] = accountHolderName;
    _data['ifsc_code'] = ifscCode;
    _data['pan_no'] = panNo;
    return _data;
  }
}

class Notification {
  String? self;
  String? appraiser;

  Notification({
    this.self,
    this.appraiser,
  });

  Notification.fromJson(Map<String, dynamic> json){
    self = json['self'];
    appraiser = json['appraiser'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self;
    _data['appraiser'] = appraiser;
    return _data;
  }
}

class Permissions {
  List<String>? user;
  List<String>? admin;
  Permissions({
    this.user,
    this.admin,
  });

  Permissions.fromJson(Map<String, dynamic> json){
    user = List.castFrom<dynamic, String>(json['user']);
    admin = List.castFrom<dynamic, String>(json['admin']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user;
    _data['admin'] = admin;
    return _data;
  }
}