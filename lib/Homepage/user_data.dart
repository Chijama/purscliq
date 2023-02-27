// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserDataModel({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    dynamic message;
    UserDataModelData? data;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserDataModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class UserDataModelData {
    UserDataModelData({
        this.id,
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
        this.notifications,
        this.kyc2,
        this.virtualAccountDetails,
        this.unreadNotifications,
        this.balances,
    });

    dynamic id;
    dynamic statusId;
    dynamic roleId;
    dynamic kycId;
    String? firstName;
    String? lastName;
    String? email;
    String? customerTag;
    DateTime? emailVerifiedAt;
    DateTime? phoneVerifiedAt;
    dynamic twoFactorSecret;
    dynamic twoFactorRecoveryCodes;
    String? phone;
    dynamic terms;
    dynamic isBlacklistNg;
    String? avatarUrl;
    dynamic reason;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
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
    dynamic unreadNotificationsCount;
    dynamic totalSaving;
    BankDetails? bankDetails;
    bool? hasPendingPayRequests;
    Bvn? bvn;
    Wallet? wallet;
    Flexisave? flexisave;
    List<Flexisave>? fixedSaving;
    List<TargetSaving>? targetSaving;
    List<Beneficiary>? beneficiaries;
    List<Notification>? notifications;
    Kyc2? kyc2;
    VirtualAccountDetails? virtualAccountDetails;
    List<Notification>? unreadNotifications;
    List<Balance>? balances;

    factory UserDataModelData.fromJson(Map<String, dynamic> json) => UserDataModelData(
        id: json["id"],
        statusId: json["status_id"],
        roleId: json["role_id"],
        kycId: json["kyc_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        customerTag: json["customer_tag"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        phoneVerifiedAt: json["phone_verified_at"] == null ? null : DateTime.parse(json["phone_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        phone: json["phone"],
        terms: json["terms"],
        isBlacklistNg: json["is_blacklist_ng"],
        avatarUrl: json["avatar_url"],
        reason: json["reason"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        bvnVerified: json["bvn_verified"],
        phoneVerified: json["phone_verified"],
        isAdmin: json["is_admin"],
        isUser: json["is_user"],
        isBlocked: json["is_blocked"],
        hasKyc: json["has_kyc"],
        hasKyc2: json["has_kyc2"],
        hasKyc2Pending: json["has_kyc2_pending"],
        hasPendingLoan: json["has_pending_loan"],
        hasSecurePin: json["has_secure_pin"],
        hasPendingLoanRequest: json["has_pending_loan_request"],
        canUpdateBalance: json["can_update_balance"],
        hasKycPending: json["has_kyc_pending"],
        hasKycRejected: json["has_kyc_rejected"],
        hasCards: json["has_cards"],
        hasPassword: json["has_password"],
        hasNuban: json["has_nuban"],
        hasTransactions: json["has_transactions"],
        hasCustomerTag: json["has_customer_tag"],
        hasCardKyc: json["has_card_kyc"],
        unreadNotificationsCount: json["unread_notifications_count"],
        totalSaving: json["total_saving"],
        bankDetails: json["bank_details"] == null ? null : BankDetails.fromJson(json["bank_details"]),
        hasPendingPayRequests: json["has_pending_pay_requests"],
        bvn: json["bvn"] == null ? null : Bvn.fromJson(json["bvn"]),
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
        flexisave: json["flexisave"] == null ? null : Flexisave.fromJson(json["flexisave"]),
        fixedSaving: json["fixed_saving"] == null ? [] : List<Flexisave>.from(json["fixed_saving"]!.map((x) => Flexisave.fromJson(x))),
        targetSaving: json["target_saving"] == null ? [] : List<TargetSaving>.from(json["target_saving"]!.map((x) => TargetSaving.fromJson(x))),
        beneficiaries: json["beneficiaries"] == null ? [] : List<Beneficiary>.from(json["beneficiaries"]!.map((x) => Beneficiary.fromJson(x))),
        notifications: json["notifications"] == null ? [] : List<Notification>.from(json["notifications"]!.map((x) => Notification.fromJson(x))),
        kyc2: json["kyc2"] == null ? null : Kyc2.fromJson(json["kyc2"]),
        virtualAccountDetails: json["virtual_account_details"] == null ? null : VirtualAccountDetails.fromJson(json["virtual_account_details"]),
        unreadNotifications: json["unread_notifications"] == null ? [] : List<Notification>.from(json["unread_notifications"]!.map((x) => Notification.fromJson(x))),
        balances: json["balances"] == null ? [] : List<Balance>.from(json["balances"]!.map((x) => Balance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status_id": statusId,
        "role_id": roleId,
        "kyc_id": kycId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "customer_tag": customerTag,
        "email_verified_at": emailVerifiedAt,
        "phone_verified_at": phoneVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "phone": phone,
        "terms": terms,
        "is_blacklist_ng": isBlacklistNg,
        "avatar_url": avatarUrl,
        "reason": reason,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "name": name,
        "bvn_verified": bvnVerified,
        "phone_verified": phoneVerified,
        "is_admin": isAdmin,
        "is_user": isUser,
        "is_blocked": isBlocked,
        "has_kyc": hasKyc,
        "has_kyc2": hasKyc2,
        "has_kyc2_pending": hasKyc2Pending,
        "has_pending_loan": hasPendingLoan,
        "has_secure_pin": hasSecurePin,
        "has_pending_loan_request": hasPendingLoanRequest,
        "can_update_balance": canUpdateBalance,
        "has_kyc_pending": hasKycPending,
        "has_kyc_rejected": hasKycRejected,
        "has_cards": hasCards,
        "has_password": hasPassword,
        "has_nuban": hasNuban,
        "has_transactions": hasTransactions,
        "has_customer_tag": hasCustomerTag,
        "has_card_kyc": hasCardKyc,
        "unread_notifications_count": unreadNotificationsCount,
        "total_saving": totalSaving,
        "bank_details": bankDetails?.toJson(),
        "has_pending_pay_requests": hasPendingPayRequests,
        "bvn": bvn?.toJson(),
        "wallet": wallet?.toJson(),
        "flexisave": flexisave?.toJson(),
        "fixed_saving": fixedSaving == null ? [] : List<dynamic>.from(fixedSaving!.map((x) => x.toJson())),
        "target_saving": targetSaving == null ? [] : List<dynamic>.from(targetSaving!.map((x) => x.toJson())),
        "beneficiaries": beneficiaries == null ? [] : List<dynamic>.from(beneficiaries!.map((x) => x.toJson())),
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
        "kyc2": kyc2?.toJson(),
        "virtual_account_details": virtualAccountDetails?.toJson(),
        "unread_notifications": unreadNotifications == null ? [] : List<dynamic>.from(unreadNotifications!.map((x) => x.toJson())),
        "balances": balances == null ? [] : List<dynamic>.from(balances!.map((x) => x.toJson())),
    };
}

class Balance {
    Balance({
        this.title,
        this.amount,
        this.type,
    });

    String? title;
    String? amount;
    String? type;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        title: json["title"],
        amount: json["amount"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
        "type": type,
    };
}

class BankDetails {
    BankDetails({
        this.bankName,
        this.bankCode,
        this.accountName,
        this.accountNumber,
    });

    String? bankName;
    String? bankCode;
    String? accountName;
    String? accountNumber;

    factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
    );

    Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "bank_code": bankCode,
        "account_name": accountName,
        "account_number": accountNumber,
    };
}

class Beneficiary {
    Beneficiary({
        this.id,
        this.userId,
        this.beneficiaryId,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.customerTag,
        this.phone,
    });

    dynamic id;
    dynamic userId;
    dynamic beneficiaryId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? name;
    String? customerTag;
    String? phone;

    factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        id: json["id"],
        userId: json["user_id"],
        beneficiaryId: json["beneficiary_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        customerTag: json["customer_tag"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "beneficiary_id": beneficiaryId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "name": name,
        "customer_tag": customerTag,
        "phone": phone,
    };
}

class Bvn {
    Bvn({
        this.id,
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
    });

    dynamic id;
    dynamic userId;
    String? bvn;
    String? firstname;
    String? lastname;
    String? middlename;
    String? gender;
    String? phone;
    String? birthdate;
    dynamic photo;
    dynamic validLastname;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Bvn.fromJson(Map<String, dynamic> json) => Bvn(
        id: json["id"],
        userId: json["user_id"],
        bvn: json["bvn"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        middlename: json["middlename"],
        gender: json["gender"],
        phone: json["phone"],
        birthdate: json["birthdate"],
        photo: json["photo"],
        validLastname: json["valid_lastname"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bvn": bvn,
        "firstname": firstname,
        "lastname": lastname,
        "middlename": middlename,
        "gender": gender,
        "phone": phone,
        "birthdate": birthdate,
        "photo": photo,
        "valid_lastname": validLastname,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Flexisave {
    Flexisave({
        this.id,
        this.userId,
        this.statusId,
        this.amt,
        this.accruedInterest,
        this.durationInSecs,
        this.endDate,
        this.interestRate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.amountString,
    });

    dynamic id;
    dynamic userId;
    dynamic statusId;
    dynamic amt;
    dynamic accruedInterest;
    dynamic durationInSecs;
    DateTime? endDate;
    String? interestRate;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? amountString;

    factory Flexisave.fromJson(Map<String, dynamic> json) => Flexisave(
        id: json["id"],
        userId: json["user_id"],
        statusId: json["status_id"],
        amt: json["amt"],
        accruedInterest: json["accrued_interest"],
        durationInSecs: json["duration_in_secs"],
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        interestRate: json["interest_rate"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        amountString: json["amount_string"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status_id": statusId,
        "amt": amt,
        "accrued_interest": accruedInterest,
        "duration_in_secs": durationInSecs,
        "end_date": endDate,
        "interest_rate": interestRate,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "amount_string": amountString,
    };
}

class Kyc2 {
    Kyc2({
        this.id,
        this.userId,
        this.companyName,
        this.name,
        this.employeeIdNumber,
        this.jobPosition,
        this.employmentType,
        this.employmentStartDate,
        this.employmentEndDate,
        this.netMonthlySalary,
        this.sidehustles,
        this.otherIncomeSource,
        this.currentlyServingLoan,
        this.currentLoanPeriod,
        this.salaryAccountNumber,
        this.salaryBankName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.statusId,
    });

    dynamic id;
    dynamic userId;
    String? companyName;
    String? name;
    dynamic employeeIdNumber;
    String? jobPosition;
    String? employmentType;
    DateTime? employmentStartDate;
    dynamic employmentEndDate;
    dynamic netMonthlySalary;
    dynamic sidehustles;
    dynamic otherIncomeSource;
    dynamic currentlyServingLoan;
    dynamic currentLoanPeriod;
    String? salaryAccountNumber;
    String? salaryBankName;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    dynamic statusId;

    factory Kyc2.fromJson(Map<String, dynamic> json) => Kyc2(
        id: json["id"],
        userId: json["user_id"],
        companyName: json["company_name"],
        name: json["name"],
        employeeIdNumber: json["employee_id_number"],
        jobPosition: json["job_position"],
        employmentType: json["employment_type"],
        employmentStartDate: json["employment_start_date"] == null ? null : DateTime.parse(json["employment_start_date"]),
        employmentEndDate: json["employment_end_date"],
        netMonthlySalary: json["net_monthly_salary"],
        sidehustles: json["sidehustles"],
        otherIncomeSource: json["other_income_source"],
        currentlyServingLoan: json["currently_serving_loan"],
        currentLoanPeriod: json["current_loan_period"],
        salaryAccountNumber: json["salary_account_number"],
        salaryBankName: json["salary_bank_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        statusId: json["status_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_name": companyName,
        "name": name,
        "employee_id_number": employeeIdNumber,
        "job_position": jobPosition,
        "employment_type": employmentType,
        "employment_start_date": "${employmentStartDate!.year.toString().padLeft(4, '0')}-${employmentStartDate!.month.toString().padLeft(2, '0')}-${employmentStartDate!.day.toString().padLeft(2, '0')}",
        "employment_end_date": employmentEndDate,
        "net_monthly_salary": netMonthlySalary,
        "sidehustles": sidehustles,
        "other_income_source": otherIncomeSource,
        "currently_serving_loan": currentlyServingLoan,
        "current_loan_period": currentLoanPeriod,
        "salary_account_number": salaryAccountNumber,
        "salary_bank_name": salaryBankName,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "status_id": statusId,
    };
}

class Notification {
    Notification({
        this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt,
    });

    String? id;
    NotificationType? type;
    NotifiableType? notifiableType;
    dynamic notifiableId;
    NotificationData? data;
    dynamic readAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        type: notificationTypeValues.map[json["type"]]!,
        notifiableType: notifiableTypeValues.map[json["notifiable_type"]]!,
        notifiableId: json["notifiable_id"],
        data: json["data"] == null ? null : NotificationData.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": notificationTypeValues.reverse[type],
        "notifiable_type": notifiableTypeValues.reverse[notifiableType],
        "notifiable_id": notifiableId,
        "data": data?.toJson(),
        "read_at": readAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class NotificationData {
    NotificationData({
        this.title,
        this.message,
        this.type,
        this.url,
        this.priority,
        this.description,
    });

    String? title;
    String? message;
    DataType? type;
    Url? url;
    Priority? priority;
    String? description;

    factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
        title: json["title"],
        message: json["message"],
        type: dataTypeValues.map[json["type"]]!,
        url: urlValues.map[json["url"]]!,
        priority: priorityValues.map[json["priority"]]!,
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "type": dataTypeValues.reverse[type],
        "url": urlValues.reverse[url],
        "priority": priorityValues.reverse[priority],
        "description": description,
    };
}

enum Priority { HIGH }

final priorityValues = EnumValues({
    "high": Priority.HIGH
});

enum DataType { MESSAGE, CARD }

final dataTypeValues = EnumValues({
    "card": DataType.CARD,
    "message": DataType.MESSAGE
});

enum Url { JAVASCRIPT }

final urlValues = EnumValues({
    "javascript:;": Url.JAVASCRIPT
});

enum NotifiableType { APP_MODELS_USER }

final notifiableTypeValues = EnumValues({
    "App\\Models\\User": NotifiableType.APP_MODELS_USER
});

enum NotificationType { APP_NOTIFICATIONS_SAVINGS_TARGET_SAVING_AUTO_DEBIT, APP_NOTIFICATIONS_LOAN_NOTIFY, APP_NOTIFICATIONS_SAVINGS_FIXED_WALLET_CLOSED, APP_NOTIFICATIONS_USERS_TRANSFER_WITH_TAG_NOTIFICATION, APP_NOTIFICATIONS_USER_TRANSFER_NOTIFY, APP_NOTIFICATIONS_CARDS_CARD_TOP_UP_NOTIFICATION, APP_NOTIFICATIONS_CARDS_CARD_WITHDRAWAL_ALERT, APP_NOTIFICATIONS_CARDS_NEW_CARD_NOTIFICATION, APP_NOTIFICATIONS_DEBUG_EMAIL_NOTIFY, APP_NOTIFICATIONS_USER_DEPOSIT_NOTIFY }

final notificationTypeValues = EnumValues({
    "App\\Notifications\\Cards\\CardTopUpNotification": NotificationType.APP_NOTIFICATIONS_CARDS_CARD_TOP_UP_NOTIFICATION,
    "App\\Notifications\\Cards\\CardWithdrawalAlert": NotificationType.APP_NOTIFICATIONS_CARDS_CARD_WITHDRAWAL_ALERT,
    "App\\Notifications\\Cards\\NewCardNotification": NotificationType.APP_NOTIFICATIONS_CARDS_NEW_CARD_NOTIFICATION,
    "App\\Notifications\\DebugEmailNotify": NotificationType.APP_NOTIFICATIONS_DEBUG_EMAIL_NOTIFY,
    "App\\Notifications\\LoanNotify": NotificationType.APP_NOTIFICATIONS_LOAN_NOTIFY,
    "App\\Notifications\\Savings\\FixedWalletClosed": NotificationType.APP_NOTIFICATIONS_SAVINGS_FIXED_WALLET_CLOSED,
    "App\\Notifications\\Savings\\TargetSavingAutoDebit": NotificationType.APP_NOTIFICATIONS_SAVINGS_TARGET_SAVING_AUTO_DEBIT,
    "App\\Notifications\\Users\\TransferWithTagNotification": NotificationType.APP_NOTIFICATIONS_USERS_TRANSFER_WITH_TAG_NOTIFICATION,
    "App\\Notifications\\UserDepositNotify": NotificationType.APP_NOTIFICATIONS_USER_DEPOSIT_NOTIFY,
    "App\\Notifications\\UserTransferNotify": NotificationType.APP_NOTIFICATIONS_USER_TRANSFER_NOTIFY
});

class TargetSaving {
    TargetSaving({
        this.id,
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
        this.amountString,
    });

    dynamic id;
    dynamic userId;
    dynamic statusId;
    String? targetTitle;
    dynamic targetAmt;
    dynamic amt;
    dynamic accruedInterest;
    dynamic interestRate;
    dynamic debitAmt;
    DateTime? nextDebitDate;
    DateTime? endDate;
    dynamic durationInSecs;
    String? debitFrequency;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? period;
    String? amountString;

    factory TargetSaving.fromJson(Map<String, dynamic> json) => TargetSaving(
        id: json["id"],
        userId: json["user_id"],
        statusId: json["status_id"],
        targetTitle: json["target_title"],
        targetAmt: json["target_amt"],
        amt: json["amt"],
        accruedInterest: json["accrued_interest"],
        interestRate: json["interest_rate"],
        debitAmt: json["debit_amt"],
        nextDebitDate: json["next_debit_date"] == null ? null : DateTime.parse(json["next_debit_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        durationInSecs: json["duration_in_secs"],
        debitFrequency: json["debit_frequency"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        period: json["period"],
        amountString: json["amount_string"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status_id": statusId,
        "target_title": targetTitle,
        "target_amt": targetAmt,
        "amt": amt,
        "accrued_interest": accruedInterest,
        "interest_rate": interestRate,
        "debit_amt": debitAmt,
        "next_debit_date": nextDebitDate,
        "end_date": endDate,
        "duration_in_secs": durationInSecs,
        "debit_frequency": debitFrequency,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "period": period,
        "amount_string": amountString,
    };
}

class VirtualAccountDetails {
    VirtualAccountDetails({
        this.id,
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
        this.updatedAt,
    });

    dynamic id;
    dynamic userId;
    String? customerCode;
    dynamic customerId;
    String? domain;
    String? firstName;
    String? lastName;
    String? phone;
    String? email;
    String? bankName;
    dynamic bankId;
    String? bankCode;
    String? prefix;
    String? accountName;
    String? accountNumber;
    String? currency;
    String? status;
    String? assignment;
    String? reference;
    dynamic statusId;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory VirtualAccountDetails.fromJson(Map<String, dynamic> json) => VirtualAccountDetails(
        id: json["id"],
        userId: json["user_id"],
        customerCode: json["customer_code"],
        customerId: json["customer_id"],
        domain: json["domain"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        bankName: json["bank_name"],
        bankId: json["bank_id"],
        bankCode: json["bank_code"],
        prefix: json["prefix"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        currency: json["currency"],
        status: json["status"],
        assignment: json["assignment"],
        reference: json["reference"],
        statusId: json["status_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "customer_code": customerCode,
        "customer_id": customerId,
        "domain": domain,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "bank_name": bankName,
        "bank_id": bankId,
        "bank_code": bankCode,
        "prefix": prefix,
        "account_name": accountName,
        "account_number": accountNumber,
        "currency": currency,
        "status": status,
        "assignment": assignment,
        "reference": reference,
        "status_id": statusId,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Wallet {
    Wallet({
        this.id,
        this.userId,
        this.statusId,
        this.accNo,
        this.amt,
        this.loanAmt,
        this.type,
        this.isDefault,
        this.maxAmtTransfer,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.loanAmountString,
        this.amountString,
    });

    dynamic id;
    dynamic userId;
    dynamic statusId;
    String? accNo;
    String? amt;
    String? loanAmt;
    String? type;
    dynamic isDefault;
    dynamic maxAmtTransfer;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? loanAmountString;
    String? amountString;

    factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"],
        statusId: json["status_id"],
        accNo: json["acc_no"],
        amt: json["amt"],
        loanAmt: json["loan_amt"],
        type: json["type"],
        isDefault: json["is_default"],
        maxAmtTransfer: json["max_amt_transfer"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        loanAmountString: json["loan_amount_string"],
        amountString: json["amount_string"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status_id": statusId,
        "acc_no": accNo,
        "amt": amt,
        "loan_amt": loanAmt,
        "type": type,
        "is_default": isDefault,
        "max_amt_transfer": maxAmtTransfer,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "loan_amount_string": loanAmountString,
        "amount_string": amountString,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
