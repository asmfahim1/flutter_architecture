import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'email_hint' : 'Email',
      'internet_exception' : "We're unable to show result.\nPlease check your internet connection.",
      'general_exception' : "We're unable to process your request.\nPlease try again.",
      'retry' : 'Retry',
      'welcome_back' : 'Welcome \nBack',
      'login' : 'Login',
      'password' : 'Password',
      'loading' : 'Loading...',
    },
    'bn_BD' : {
      'email_hint' : 'ইমেইল প্রদান করুন',
      'internet_exception' : "আমরা ফলাফল দেখাতে অক্ষম।\nঅনুগ্রহ করে আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন।",
      'retry' : 'পুনরায় চেষ্টা করুন',
    },
  };
}