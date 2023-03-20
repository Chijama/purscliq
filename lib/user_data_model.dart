class UserDataModel {
  String? status;
  dynamic message;
  Fdata? fdata;

  UserDataModel({this.status, this.message, this.fdata});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    fdata = json['data'] != null ? Fdata.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (fdata != null) {
      data['data'] = fdata!.toJson();
    }
    return data;
  }
}

class Fdata {
  int? id;
  int? statusId;
  int? roleId;
  dynamic kycId;
  String? firstName;
  String? lastName;
  String? email;
  String? customerTag;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  String? phone;
  int? terms;
  dynamic isBlacklistNg;
  String? avatarUrl;
  String? reason;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Balances>? balances;
  String? name;
  bool? bvnVerified;
  bool? phoneVerified;
  bool? isAdmin;
  bool? isUser;
  bool? isBlocked;
  bool? hasKyc;
  bool? hasKyc2;
  bool? hasKyc2Pending;
  bool? hasPendingLoan;
  bool? hasSecurePin;
  bool? hasPendingLoanRequest;
  bool? canUpdateBalance;
  bool? hasKycPending;
  bool? hasKycRejected;
  bool? hasCards;
  bool? hasPassword;
  bool? hasNuban;
  bool? hasTransactions;
  bool? hasCustomerTag;
  bool? hasCardKyc;
  int? unreadNotificationsCount;
  String? totalSaving;
  BankDetails? bankDetails;
  bool? hasPendingPayRequests;
  Bvn? bvn;
  Wallet? wallet;
  Flexisave? flexisave;
  List<FixedSaving>? fixedSaving;
  List<TargetSaving>? targetSaving;
  List<Beneficiaries>? beneficiaries;
  dynamic biodata;
  List<UnreadNotifications>? unreadNotifications;

  Fdata(
      {this.id,
      this.statusId,
      this.roleId,
      this.kycId,
      this.firstName,
      this.lastName,
      this.email,
      this.customerTag,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.phone,
      this.terms,
      this.isBlacklistNg,
      this.avatarUrl,
      this.reason,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.balances,
      this.name,
      this.bvnVerified,
      this.phoneVerified,
      this.isAdmin,
      this.isUser,
      this.isBlocked,
      this.hasKyc,
      this.hasKyc2,
      this.hasKyc2Pending,
      this.hasPendingLoan,
      this.hasSecurePin,
      this.hasPendingLoanRequest,
      this.canUpdateBalance,
      this.hasKycPending,
      this.hasKycRejected,
      this.hasCards,
      this.hasPassword,
      this.hasNuban,
      this.hasTransactions,
      this.hasCustomerTag,
      this.hasCardKyc,
      this.unreadNotificationsCount,
      this.totalSaving,
      this.bankDetails,
      this.hasPendingPayRequests,
      this.bvn,
      this.wallet,
      this.flexisave,
      this.fixedSaving,
      this.targetSaving,
      this.beneficiaries,
      this.biodata,
      this.unreadNotifications});

  Fdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusId = json['status_id'];
    roleId = json['role_id'];
    kycId = json['kyc_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    customerTag = json['customer_tag'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    phone = json['phone'];
    terms = json['terms'];
    isBlacklistNg = json['is_blacklist_ng'];
    avatarUrl = json['avatar_url'];
    reason = json['reason'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['balances'] != null) {
      balances = <Balances>[];
      json['balances'].forEach((v) {
        balances!.add(Balances.fromJson(v));
      });
    }
    name = json['name'];
    bvnVerified = json['bvn_verified'];
    phoneVerified = json['phone_verified'];
    isAdmin = json['is_admin'];
    isUser = json['is_user'];
    isBlocked = json['is_blocked'];
    hasKyc = json['has_kyc'];
    hasKyc2 = json['has_kyc2'];
    hasKyc2Pending = json['has_kyc2_pending'];
    hasPendingLoan = json['has_pending_loan'];
    hasSecurePin = json['has_secure_pin'];
    hasPendingLoanRequest = json['has_pending_loan_request'];
    canUpdateBalance = json['can_update_balance'];
    hasKycPending = json['has_kyc_pending'];
    hasKycRejected = json['has_kyc_rejected'];
    hasCards = json['has_cards'];
    hasPassword = json['has_password'];
    hasNuban = json['has_nuban'];
    hasTransactions = json['has_transactions'];
    hasCustomerTag = json['has_customer_tag'];
    hasCardKyc = json['has_card_kyc'];
    unreadNotificationsCount = json['unread_notifications_count'];
    totalSaving = json['total_saving'];
    bankDetails = json['bank_details'] != null
        ? BankDetails.fromJson(json['bank_details'])
        : null;
    hasPendingPayRequests = json['has_pending_pay_requests'];
    bvn = json['bvn'] != null ? Bvn.fromJson(json['bvn']) : null;
    wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    flexisave = json['flexisave'] != null
        ? Flexisave.fromJson(json['flexisave'])
        : null;
    if (json['fixed_saving'] != null) {
      fixedSaving = <FixedSaving>[];
      json['fixed_saving'].forEach((v) {
        fixedSaving!.add(FixedSaving.fromJson(v));
      });
    }
    if (json['target_saving'] != null) {
      targetSaving = <TargetSaving>[];
      json['target_saving'].forEach((v) {
        targetSaving!.add(TargetSaving.fromJson(v));
      });
    }
    if (json['beneficiaries'] != null) {
      beneficiaries = <Beneficiaries>[];
      json['beneficiaries'].forEach((v) {
        beneficiaries!.add(Beneficiaries.fromJson(v));
      });
    }
    biodata = json['biodata'];
    if (json['unread_notifications'] != null) {
      unreadNotifications = <UnreadNotifications>[];
      json['unread_notifications'].forEach((v) {
        unreadNotifications!.add(UnreadNotifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status_id'] = statusId;
    data['role_id'] = roleId;
    data['kyc_id'] = kycId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['customer_tag'] = customerTag;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['two_factor_secret'] = twoFactorSecret;
    data['two_factor_recovery_codes'] = twoFactorRecoveryCodes;
    data['phone'] = phone;
    data['terms'] = terms;
    data['is_blacklist_ng'] = isBlacklistNg;
    data['avatar_url'] = avatarUrl;
    data['reason'] = reason;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (balances != null) {
      data['balances'] = balances!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['bvn_verified'] = bvnVerified;
    data['phone_verified'] = phoneVerified;
    data['is_admin'] = isAdmin;
    data['is_user'] = isUser;
    data['is_blocked'] = isBlocked;
    data['has_kyc'] = hasKyc;
    data['has_kyc2'] = hasKyc2;
    data['has_kyc2_pending'] = hasKyc2Pending;
    data['has_pending_loan'] = hasPendingLoan;
    data['has_secure_pin'] = hasSecurePin;
    data['has_pending_loan_request'] = hasPendingLoanRequest;
    data['can_update_balance'] = canUpdateBalance;
    data['has_kyc_pending'] = hasKycPending;
    data['has_kyc_rejected'] = hasKycRejected;
    data['has_cards'] = hasCards;
    data['has_password'] = hasPassword;
    data['has_nuban'] = hasNuban;
    data['has_transactions'] = hasTransactions;
    data['has_customer_tag'] = hasCustomerTag;
    data['has_card_kyc'] = hasCardKyc;
    data['unread_notifications_count'] = unreadNotificationsCount;
    data['total_saving'] = totalSaving;
    if (bankDetails != null) {
      data['bank_details'] = bankDetails!.toJson();
    }
    data['has_pending_pay_requests'] = hasPendingPayRequests;
    if (bvn != null) {
      data['bvn'] = bvn!.toJson();
    }
    if (wallet != null) {
      data['wallet'] = wallet!.toJson();
    }
    if (flexisave != null) {
      data['flexisave'] = flexisave!.toJson();
    }
    if (fixedSaving != null) {
      data['fixed_saving'] = fixedSaving!.map((v) => v.toJson()).toList();
    }
    if (targetSaving != null) {
      data['target_saving'] = targetSaving!.map((v) => v.toJson()).toList();
    }
    if (beneficiaries != null) {
      data['beneficiaries'] = beneficiaries!.map((v) => v.toJson()).toList();
    }
    data['biodata'] = biodata;
    if (unreadNotifications != null) {
      data['unread_notifications'] =
          unreadNotifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Balances {
  String? title;
  String? amount;
  String? type;

  Balances({this.title, this.amount, this.type});

  Balances.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    amount = json['amount'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['amount'] = amount;
    data['type'] = type;
    return data;
  }
}

class BankDetails {
  int? id;
  int? userId;
  String? customerCode;
  dynamic customerId;
  String? domain;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? bankName;
  int? bankId;
  String? bankCode;
  String? prefix;
  String? accountName;
  String? accountNumber;
  String? currency;
  String? status;
  String? assignment;
  String? reference;
  int? statusId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  BankDetails(
      {this.id,
      this.userId,
      this.customerCode,
      this.customerId,
      this.domain,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.bankName,
      this.bankId,
      this.bankCode,
      this.prefix,
      this.accountName,
      this.accountNumber,
      this.currency,
      this.status,
      this.assignment,
      this.reference,
      this.statusId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  BankDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    customerCode = json['customer_code'];
    customerId = json['customer_id'];
    domain = json['domain'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    bankName = json['bank_name'];
    bankId = json['bank_id'];
    bankCode = json['bank_code'];
    prefix = json['prefix'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    currency = json['currency'];
    status = json['status'];
    assignment = json['assignment'];
    reference = json['reference'];
    statusId = json['status_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['customer_code'] = customerCode;
    data['customer_id'] = customerId;
    data['domain'] = domain;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['bank_name'] = bankName;
    data['bank_id'] = bankId;
    data['bank_code'] = bankCode;
    data['prefix'] = prefix;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    data['currency'] = currency;
    data['status'] = status;
    data['assignment'] = assignment;
    data['reference'] = reference;
    data['status_id'] = statusId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Bvn {
  int? id;
  int? userId;
  String? bvn;
  String? firstname;
  String? lastname;
  String? middlename;
  String? gender;
  String? phone;
  String? birthdate;
  dynamic photo;
  int? validLastname;
  String? createdAt;
  String? updatedAt;
  int? isVerified;

  Bvn(
      {this.id,
      this.userId,
      this.bvn,
      this.firstname,
      this.lastname,
      this.middlename,
      this.gender,
      this.phone,
      this.birthdate,
      this.photo,
      this.validLastname,
      this.createdAt,
      this.updatedAt,
      this.isVerified});

  Bvn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bvn = json['bvn'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    middlename = json['middlename'];
    gender = json['gender'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    photo = json['photo'];
    validLastname = json['valid_lastname'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['bvn'] = bvn;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['middlename'] = middlename;
    data['gender'] = gender;
    data['phone'] = phone;
    data['birthdate'] = birthdate;
    data['photo'] = photo;
    data['valid_lastname'] = validLastname;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_verified'] = isVerified;
    return data;
  }
}

class Wallet {
  int? id;
  int? userId;
  int? statusId;
  String? accNo;
  String? amt;
  String? runningFees;
  String? loanAmt;
  String? type;
  int? isDefault;
  dynamic maxAmtTransfer;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? loanAmountString;
  String? amountString;
  int? availableBalance;

  Wallet(
      {this.id,
      this.userId,
      this.statusId,
      this.accNo,
      this.amt,
      this.runningFees,
      this.loanAmt,
      this.type,
      this.isDefault,
      this.maxAmtTransfer,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.loanAmountString,
      this.amountString,
      this.availableBalance});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    statusId = json['status_id'];
    accNo = json['acc_no'];
    amt = json['amt'];
    runningFees = json['running_fees'];
    loanAmt = json['loan_amt'];
    type = json['type'];
    isDefault = json['is_default'];
    maxAmtTransfer = json['max_amt_transfer'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    loanAmountString = json['loan_amount_string'];
    amountString = json['amount_string'];
    availableBalance = json['available_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status_id'] = statusId;
    data['acc_no'] = accNo;
    data['amt'] = amt;
    data['running_fees'] = runningFees;
    data['loan_amt'] = loanAmt;
    data['type'] = type;
    data['is_default'] = isDefault;
    data['max_amt_transfer'] = maxAmtTransfer;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['loan_amount_string'] = loanAmountString;
    data['amount_string'] = amountString;
    data['available_balance'] = availableBalance;
    return data;
  }
}

class Flexisave {
  int? id;
  int? userId;
  int? statusId;
  int? amt;
  String? interestRate;
  int? accruedInterest;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? amountString;

  Flexisave(
      {this.id,
      this.userId,
      this.statusId,
      this.amt,
      this.interestRate,
      this.accruedInterest,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.amountString});

  Flexisave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    statusId = json['status_id'];
    amt = json['amt'];
    interestRate = json['interest_rate'];
    accruedInterest = json['accrued_interest'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    amountString = json['amount_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status_id'] = statusId;
    data['amt'] = amt;
    data['interest_rate'] = interestRate;
    data['accrued_interest'] = accruedInterest;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['amount_string'] = amountString;
    return data;
  }
}

class FixedSaving {
  int? id;
  int? userId;
  int? statusId;
  int? amt;
  int? accruedInterest;
  int? durationInSecs;
  String? endDate;
  String? interestRate;
  String? createdAt;
  String? updatedAt;

  FixedSaving(
      {this.id,
      this.userId,
      this.statusId,
      this.amt,
      this.accruedInterest,
      this.durationInSecs,
      this.endDate,
      this.interestRate,
      this.createdAt,
      this.updatedAt});

  FixedSaving.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    statusId = json['status_id'];
    amt = json['amt'];
    accruedInterest = json['accrued_interest'];
    durationInSecs = json['duration_in_secs'];
    endDate = json['end_date'];
    interestRate = json['interest_rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status_id'] = statusId;
    data['amt'] = amt;
    data['accrued_interest'] = accruedInterest;
    data['duration_in_secs'] = durationInSecs;
    data['end_date'] = endDate;
    data['interest_rate'] = interestRate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TargetSaving {
  int? id;
  int? userId;
  int? statusId;
  String? targetTitle;
  int? targetAmt;
  int? amt;
  dynamic accruedInterest;
  int? interestRate;
  int? debitAmt;
  String? nextDebitDate;
  String? endDate;
  dynamic durationInSecs;
  String? debitFrequency;
  String? createdAt;
  String? updatedAt;
  String? period;
  String? amountString;

  TargetSaving(
      {this.id,
      this.userId,
      this.statusId,
      this.targetTitle,
      this.targetAmt,
      this.amt,
      this.accruedInterest,
      this.interestRate,
      this.debitAmt,
      this.nextDebitDate,
      this.endDate,
      this.durationInSecs,
      this.debitFrequency,
      this.createdAt,
      this.updatedAt,
      this.period,
      this.amountString});

  TargetSaving.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    statusId = json['status_id'];
    targetTitle = json['target_title'];
    targetAmt = json['target_amt'];
    amt = json['amt'];
    accruedInterest = json['accrued_interest'];
    interestRate = json['interest_rate'];
    debitAmt = json['debit_amt'];
    nextDebitDate = json['next_debit_date'];
    endDate = json['end_date'];
    durationInSecs = json['duration_in_secs'];
    debitFrequency = json['debit_frequency'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    period = json['period'];
    amountString = json['amount_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['status_id'] = statusId;
    data['target_title'] = targetTitle;
    data['target_amt'] = targetAmt;
    data['amt'] = amt;
    data['accrued_interest'] = accruedInterest;
    data['interest_rate'] = interestRate;
    data['debit_amt'] = debitAmt;
    data['next_debit_date'] = nextDebitDate;
    data['end_date'] = endDate;
    data['duration_in_secs'] = durationInSecs;
    data['debit_frequency'] = debitFrequency;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['period'] = period;
    data['amount_string'] = amountString;
    return data;
  }
}

class Beneficiaries {
  int? id;
  int? userId;
  int? beneficiaryId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? customerTag;
  String? phone;

  Beneficiaries(
      {this.id,
      this.userId,
      this.beneficiaryId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.customerTag,
      this.phone});

  Beneficiaries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    beneficiaryId = json['beneficiary_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    customerTag = json['customer_tag'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['beneficiary_id'] = beneficiaryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['name'] = name;
    data['customer_tag'] = customerTag;
    data['phone'] = phone;
    return data;
  }
}

class UnreadNotifications {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  dynamic readAt;
  String? createdAt;
  String? updatedAt;

  UnreadNotifications(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  UnreadNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Data {
  String? title;
  String? message;
  String? type;

  Data({this.title, this.message, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['type'] = type;
    return data;
  }
}
