import 'dart:convert';

class AppUser {
  final String? id;
  final DateTime? createdAt;
  final String? phone;
  final String? name;
  final String? email;
  AppUser({
    this.id,
    this.createdAt,
    this.phone,
    this.name,
    this.email,
  });

  AppUser copyWith({
    String? id,
    String? user,
    String? profilePic,
    String? bio,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? loggedInAt,
    String? phone,
    String? name,
    String? email,
    bool? loggedInAsCustomer,
    bool? isCustomer,
    bool? isServiceProvider,
    bool? isVerified,
    String? lastLoginAs,
    bool? verifiedAsSp,
    String? identityDocument,
    String? insuranceDocument,
  }) {
    return AppUser(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'phone': phone,
      'name': name,
      'email': email,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] != null ? map['id'] as String : null,
      createdAt: map['created_at'] != null
          ? DateTime.parse(map['created_at'] as String)
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  static List<AppUser>? fromJsonList(List<dynamic>? jsonList) {
    return jsonList?.map((e) => AppUser.fromMap(e)).toList();
  }
}
