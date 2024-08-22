import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter Email',
          'password_hint': 'Enter Password',
          'internet_exception':
              'We Are Unable To Show Results\nPlease Check Your Data Connection',
          'general_exception':
              'We Are Unable to Process Your Request\n Please Try Again',
          'welcome_back': 'Welcome\nBack',
          'login': 'Login'
        },
        'hi_In': {
          'email_hint': 'ईमेल दर्ज करें',
          'password_hint': 'पास वर्ड दर्ज करें',
          'internet_exception':
              'हम परिणाम दिखाने में असमर्थ हैं\nकृपया अपना डेटा कनेक्शन जांचें',
          'general_exception':
              'हम आपके अनुरोध को संसाधित करने में असमर्थ हैं\nकृपया पुनः प्रयास करें',
          'welcome_back': 'वापसी पर स्वागत है',
          'login': 'लॉग इन करें'
        }
      };
}
