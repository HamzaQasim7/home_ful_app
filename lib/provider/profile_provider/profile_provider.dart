import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../core/services/profile_service.dart';
import '../../models/org_profile_model.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? organizationName;
  OrganizationType? organizationType;
  String? contactNumber;
  String? contactEmail;
  String? primaryAddress;
  String? city;
  String? state;
  OrganizationFacilityType? facilityType;
  String? organizationNumber;
  String? websiteUrl;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setOrganizationName(String name) {
    organizationName = name;
    notifyListeners();
  }

  void setOrganizationType(String type) {
    organizationType = _getOrganizationTypeFromString(type);
    notifyListeners();
  }

  void setContactNumber(String number) {
    contactNumber = number;
    notifyListeners();
  }

  void setContactEmail(String email) {
    contactEmail = email;
    notifyListeners();
  }

  void setPrimaryAddress(String address) {
    primaryAddress = address;
    notifyListeners();
  }

  void setCity(String cityName) {
    city = cityName;
    notifyListeners();
  }

  void setState(String stateName) {
    state = stateName;
    notifyListeners();
  }

  void setFacilityType(String type) {
    facilityType = _getFacilityTypeFromString(type);
    notifyListeners();
  }

  void setOrganizationNumber(String number) {
    organizationNumber = number;
    notifyListeners();
  }

  void setWebsiteUrl(String url) {
    websiteUrl = url;
    notifyListeners();
  }

  // Helper methods to convert strings to enum values
  OrganizationType _getOrganizationTypeFromString(String type) {
    switch (type) {
      case 'OrganizationType.nonProfit':
        return OrganizationType.nonProfit;
      case 'OrganizationType.religiousInstitution':
        return OrganizationType.religiousInstitution;
      case 'OrganizationType.communityGroup':
        return OrganizationType.communityGroup;
      default:
        return OrganizationType.nonProfit; // default case
    }
  }

  OrganizationFacilityType _getFacilityTypeFromString(String type) {
    switch (type) {
      case 'OrganizationFacilityType.kitchen':
        return OrganizationFacilityType.kitchen;
      case 'OrganizationFacilityType.pantry':
        return OrganizationFacilityType.pantry;
      case 'OrganizationFacilityType.closet':
        return OrganizationFacilityType.closet;
      default:
        return OrganizationFacilityType.kitchen; // default case
    }
  }

  Future<void> saveProfile(String userId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      setLoading(true);
      try {
        await _profileService.createProfile(user.uid, {
          'organizationType': organizationType,
          'contactNumber': contactNumber,
          'contactEmail': contactEmail,
          'primaryAddress': primaryAddress,
          'city': city,
          'state': state,
          'facilityType': facilityType,
          'organizationNumber': organizationNumber,
          'websiteUrl': websiteUrl,
          'createdBy': user.uid,
        });
      } catch (e) {
        print('Error saving profile: $e');
        rethrow;
      } finally {
        setLoading(false);
      }
    }
  }
}
