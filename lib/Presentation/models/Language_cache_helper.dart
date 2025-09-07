import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
    Future <void> cacheLanguageCode(String languageCode)async{
      final prefs = await SharedPreferences.getInstance(); 
      prefs.setString("Locale", languageCode);
    }
    Future<String> getcachedLanguageCode() async{
      final prefs = await SharedPreferences.getInstance();
      final cachedLanguageCode=prefs.getString("Locale");
      if(cachedLanguageCode!=null) {
        return cachedLanguageCode;
      }
      else{
        return "en";
      }
    }





}