import 'dart:convert';

ValidateUserModel validateUserModelFromJson(String str) => ValidateUserModel.fromJson(json.decode(str));

String validateUserModelToJson(ValidateUserModel data) => json.encode(data.toJson());

class ValidateUserModel {
  ValidateUserModel({
    this.isValid,
    this.customerId,
  });

  bool ? isValid;
  int ? customerId;

  factory ValidateUserModel.fromJson(Map<String, dynamic> json) => ValidateUserModel(
    isValid: json["is_valid"],
    customerId: json["customer_id"],
  );

  Map<String, dynamic> toJson() => {
    "is_valid": isValid,
    "customer_id": customerId,
  };
}