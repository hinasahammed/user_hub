import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
	int? id;
	String? name;
	String? username;
	String? email;
	Address? address;
	String? phone;
	String? website;
	Company? company;

	UserModel({
		this.id, 
		this.name, 
		this.username, 
		this.email, 
		this.address, 
		this.phone, 
		this.website, 
		this.company, 
	});

	factory UserModel.fromJson(Map<String, dynamic> json) {
		return _$UserModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
