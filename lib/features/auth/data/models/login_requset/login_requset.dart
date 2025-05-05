import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_requset.g.dart';

@JsonSerializable()
class LoginRequset extends Equatable {
  final String? email;
  final String? password;

  const LoginRequset({this.email, this.password});

  factory LoginRequset.fromJson(Map<String, dynamic> json) {
    return _$LoginRequsetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequsetToJson(this);

  LoginRequset copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequset(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, password];
}
