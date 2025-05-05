import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  int? avaterId;

  RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.avaterId,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  RegisterRequest copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    int? avaterId,
  }) {
    return RegisterRequest(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      avaterId: avaterId ?? this.avaterId,
    );
  }
}
