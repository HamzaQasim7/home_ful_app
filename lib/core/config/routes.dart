import 'package:flutter/material.dart';
import 'package:home_ful/modules/News/news_screen.dart';
import 'package:home_ful/modules/auth/e-mail_confirmation_screen.dart';
import 'package:home_ful/modules/auth/edit_profile/edit_password_screen.dart';
import 'package:home_ful/modules/auth/edit_profile/edit_personal_detail.dart';
import 'package:home_ful/modules/auth/edit_profile/update_email_screen.dart';
import 'package:home_ful/modules/bed_confirmation/bed_confirmation_screen.dart';
import 'package:home_ful/modules/general_resource/general_resource_screen.dart';
import 'package:home_ful/modules/general_resource/legal_help.dart';
import 'package:home_ful/modules/guest_account/guest_email_screen.dart';
import 'package:home_ful/modules/guest_account/guest_name_screen.dart';
import 'package:home_ful/modules/parking_spot/news_details_screen.dart';
import 'package:home_ful/modules/parking_spot/parking_spots.dart';
import 'package:home_ful/modules/resources/resources_financial_assistance.dart';
import 'package:home_ful/modules/reservation_screens/bunk_bed_screen.dart';
import 'package:home_ful/modules/reservation_screens/reserving_detail_screen.dart';
import 'package:home_ful/modules/settings/components/about_us.dart';
import 'package:home_ful/modules/settings/components/notification_screen.dart';
import 'package:home_ful/modules/shelter/shelter_item_screen.dart';
import 'package:provider/provider.dart';

import '../../modules/auth/account_creation/account_creation_form.dart';
import '../../modules/auth/account_creation/email_screen.dart';
import '../../modules/auth/account_creation/name_screen.dart';
import '../../modules/auth/account_creation/profile_image_picker_screen.dart';
import '../../modules/auth/password_screen.dart';
import '../../modules/auth/reset_password_screen.dart';
import '../../modules/auth/signin_screen.dart';
import '../../modules/auth/signup_screen.dart';
import '../../modules/auth/viewmodel/auth_viewmodel.dart';
import '../../modules/dashboard/auth_state_screen.dart';
import '../../modules/dashboard/dashboard_screen.dart';
import '../../modules/onboarding/intro_screen.dart';
import '../../modules/onboarding/splash_screen.dart';
import '../../modules/search_item_location/search_item_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../modules/shelter/shelter_item_detail.dart';
import '../../modules/shelter/stand_by_screen.dart';
import '../constants/strings.dart';

class Routes {
  static const String splash = "/";
  static const String intro = "/intro";
  static const String location = "/location";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String resourceFinancial = "/resource-financial";
  static const String profileCreation = "/profile_creation";
  static const String passwordScreen = "/password_screen";
  static const String editPasswordScreen = "/password_screen";
  static const String authState = "/auth-state";
  static const String resetEmail = "/reset-email";
  static const String locationListing = "/location-listing";
  static const String searchLocation = "/search-location";
  static const String dashboard = "/dashboard";
  static const String itemForm = "/item-form";
  static const String itemCompleted = "/item-completed";
  static const String settings = "/settings";
  static const String aboutUs = "/about-us";
  static const String shelterDetail = "/shelter-detail";
  static const String standBy = "/stand_by";
  static const String newsDetailScreen = "/news-detail";
  static const String adminItems = "/admin-items";
  static const String reservingDetail = "/reserving_detail";
  static const String orgItemsDetail = "/org-items_detail";
  static const String emailScreen = "/email-screen";
  static const String createPassScreen = "/create-pass-screen";
  static const String accountForm = "/account-form";
  static const String nameScreen = "/name-screen";
  static const String profileImgScreen = "/profile-image-screen";
  static const String bunkBedScreen = "/bunk-bed-screen";
  static const String newsScreen = "/news-screen";
  static const String generalRScreen = "/general-resource-screen";
  static const String legalHelp = "/legal-help-screen";
  static const String about = "/about-screen";
  static const String notifications = "/notification-screen";
  static const String editName = "/edit-name-screen";
  static const String otp = "/otp-screen";
  static const String bedScreen = "/bed-screen";
  static const String shelterItemView = "/shelter-item";
  static const String parkingSlots = "/parking_slot";
  static const String guestEmailScreen = "/guest-email-screen";
  static const String guestNameScreen = "/guest-name-screen";
}

final navKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      // case Routes.location:
      //   return MaterialPageRoute(builder: (_) => const LocationScreen());
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: const SigninScreen(),
          ),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: const SignupScreen(),
          ),
        );

      case Routes.authState:
        return MaterialPageRoute(builder: (_) => const AuthStateScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case Routes.resourceFinancial:
        return MaterialPageRoute(
            builder: (_) => const ResourcesFinancialAssistance());

      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case Routes.searchLocation:
        return MaterialPageRoute(builder: (_) => const SearchLocationScreen());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.shelterDetail:
        return MaterialPageRoute(builder: (_) => const ShelterDetailScreen());
      case Routes.standBy:
        return MaterialPageRoute(builder: (_) => const StandByScreen());
      case Routes.emailScreen:
        return MaterialPageRoute(builder: (_) => const EmailScreen());
      case Routes.createPassScreen:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      case Routes.accountForm:
        return MaterialPageRoute(builder: (_) => const AccountCreationForm());
      case Routes.nameScreen:
        return MaterialPageRoute(builder: (_) => const NameScreen());
      case Routes.profileImgScreen:
        return MaterialPageRoute(builder: (_) => const ImagePickerScreen());
      case Routes.reservingDetail:
        return MaterialPageRoute(builder: (_) => const ReservingDetailScreen());
      case Routes.bunkBedScreen:
        return MaterialPageRoute(builder: (_) => const BunkBedScreen());
      case Routes.newsDetailScreen:
        return MaterialPageRoute(builder: (_) => const NewsDetailPage());
      case Routes.newsScreen:
        return MaterialPageRoute(builder: (_) => const NewsScreen());
      case Routes.generalRScreen:
        return MaterialPageRoute(builder: (_) => GeneralResourceScreen());
      case Routes.legalHelp:
        return MaterialPageRoute(builder: (_) => const LegalHelp());
      case Routes.about:
        return MaterialPageRoute(builder: (_) => const AboutUs());
      case Routes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.editName:
        return MaterialPageRoute(
            builder: (_) => const EditPersonalDetailScreen());
      case Routes.editPasswordScreen:
        return MaterialPageRoute(builder: (_) => const EditPasswordScreen());
      case Routes.resetEmail:
        return MaterialPageRoute(builder: (_) => const UpdateEmailScreen());
      case Routes.otp:
        return MaterialPageRoute(
            builder: (_) => const EmailConfirmationScreen());
      case Routes.bedScreen:
        return MaterialPageRoute(builder: (_) => const BedConfirmationScreen());
      case Routes.shelterItemView:
        return MaterialPageRoute(builder: (_) => ShelterItemViews());
      case Routes.parkingSlots:
        return MaterialPageRoute(builder: (_) => const ParkingSpots());
      case Routes.guestEmailScreen:
        return MaterialPageRoute(builder: (_) => const GuestEmailScreen());
      case Routes.guestNameScreen:
        return MaterialPageRoute(builder: (_) => const GuestNameScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(Strings.noRouteFound),
              ),
              body: const Center(child: Text(Strings.noRouteFound)),
            ));
  }
}
