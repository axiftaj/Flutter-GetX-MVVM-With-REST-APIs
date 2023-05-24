

import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {

  @override
  Map<String , Map<String, String>> get keys => {
    'en_US' : {
      'lang_name' : 'Eng',
      'email_hint' : 'Email' ,
      'internet_exception' : "We're unable to show results.\nPlease check your data\nconenction." ,
      'general_exception' : "We're unable to process your request.\n Please try again" ,
      'welcome_back' : 'Welcome\nBack' ,
      'login' :'Login' ,
      'password_hint' :'Password' ,
    },
    'ur_PK' : {
      'lang_name' : 'اردو',
      'email_hint' : 'دسسدفاسف',
      'login' :'لاگ ان',
      'internet_exception' : "نتائج دکھانے میں ہمیں ناکامی ہوئی ہے۔\nبراہ کرم اپنا ڈیٹا کنکشن چیک کریں۔",
      
    },

  };
}