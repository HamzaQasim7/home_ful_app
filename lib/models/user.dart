class User {
  final String? username;
  final String? email;
  final bool? isVerified;
  final int? createdAt;
  final String? id;
  final DateTime? birthday;
  final String? gender;
  final String? profileImage;

  User({
    this.username,
    this.email,
    this.isVerified,
    this.createdAt,
    this.id,
    this.birthday,
    this.gender,
    this.profileImage,
  });

  // Updated copyWith method to include the new fields
  User copyWith({
    String? username,
    String? email,
    bool? isVerified,
    int? createdAt,
    String? id,
    DateTime? birthday,
    String? gender,
    String? profileImage,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
        isVerified: isVerified ?? this.isVerified,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        birthday: birthday ?? this.birthday,
        gender: gender ?? this.gender,
        profileImage: profileImage ?? this.profileImage,
      );

  // Updated fromJson method to include the new fields
  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        isVerified: json["is_verified"],
        createdAt: json['created_at'],
        id: json['id'],
        birthday:
            json["birthday"] != null ? DateTime.parse(json["birthday"]) : null,
        gender: json["gender"],
        profileImage: json["profile_image"],
      );

  // Updated toJson method to include the new fields
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "is_verified": isVerified,
        "created_at": createdAt,
        "id": id,
        "birthday": birthday?.toIso8601String(),
        "gender": gender,
        "profile_image": profileImage,
      };
}
