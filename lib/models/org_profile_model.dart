// lib/models/user_profile.dart
enum OrganizationType { nonProfit, religiousInstitution, communityGroup }

enum OrganizationFacilityType { kitchen, pantry, closet }

class UserProfile {
  final String organizationName;
  final OrganizationType organizationType;
  final String contactNumber;
  final String contactEmail;
  final String primaryAddress;
  final String city;
  final OrganizationFacilityType facilityType;
  final String? organizationNumber;
  final String? websiteUrl;
  String? createdBy;

  UserProfile({
    required this.organizationName,
    required this.organizationType,
    required this.contactNumber,
    required this.contactEmail,
    required this.primaryAddress,
    required this.city,
    required this.facilityType,
    this.organizationNumber,
    this.websiteUrl,
    this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'organizationName': organizationName,
      'organizationType': organizationType.toString(),
      'contactNumber': contactNumber,
      'contactEmail': contactEmail,
      'primaryAddress': primaryAddress,
      'city': city,
      'facilityType': facilityType.toString(),
      'organizationNumber': organizationNumber,
      'websiteUrl': websiteUrl,
      'createdBy': createdBy,
    };
  }

  Map<String, dynamic> fromMap() {
    return {
      organizationName: 'organizationName',
      organizationType.toString(): 'organizationType',
      contactNumber: 'contactNumber',
      contactEmail: 'contactEmail',
      primaryAddress: 'primaryAddress',
      city: 'city',
      facilityType.toString(): 'facilityType',
      organizationNumber.toString(): 'organizationNumber',
      websiteUrl.toString(): 'websiteUrl',
      createdBy.toString(): 'createdBy',
    };
  }
}
