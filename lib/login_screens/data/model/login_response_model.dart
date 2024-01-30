class UserDetailsModel {
  String? status;
  UserData? data;
  String? message;

  UserDetailsModel({this.status, this.data, this.message});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UserData {
  int? userId;
  String? name;
  String? emailId;
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
  String? accessToken;
  String? deviceId;
  int? companyId;
  String? role;
  bool? isAppraiser;
  Notification? notification;
  Permissions? permissions;

  UserData(
      {this.userId,
        this.name,
        this.emailId,
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
        this.accessToken,
        this.deviceId,
        this.companyId,
        this.role,
        this.isAppraiser,
        this.notification,
        this.permissions});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    emailId = json['email_id'];
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
    accessToken = json['access_token'];
    deviceId = json['device_id'];
    companyId = json['company_id'];
    role = json['role'];
    isAppraiser = json['is_appraiser'];
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
    permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email_id'] = emailId;
    data['dob'] = dob;
    data['joining_date'] = joiningDate;
    data['designation'] = designation;
    data['next_appraisal_date'] = nextAppraisalDate;
    data['contact'] = contact;
    data['bank_name'] = bankName;
    data['branch_name'] = branchName;
    data['account_number'] = accountNumber;
    data['account_holder_name'] = accountHolderName;
    data['ifsc_code'] = ifscCode;
    data['pan_no'] = panNo;
    data['access_token'] = accessToken;
    data['device_id'] = deviceId;
    data['company_id'] = companyId;
    data['role'] = role;
    data['is_appraiser'] = isAppraiser;
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (permissions != null) {
      data['permissions'] = permissions!.toJson();
    }
    return data;
  }
}

class Notification {
  String? self;
  String? appraiser;

  Notification({this.self, this.appraiser});

  Notification.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    appraiser = json['appraiser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['appraiser'] = appraiser;
    return data;
  }
}

class Permissions {
  List<String>? user;
  List<String>? admin;

  Permissions({this.user, this.admin});

  Permissions.fromJson(Map<String, dynamic> json) {
    user = json['user'].cast<String>();
    admin = json['admin'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['admin'] = admin;
    return data;
  }
}