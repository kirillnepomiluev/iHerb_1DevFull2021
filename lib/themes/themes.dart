import 'package:flutter/material.dart';

import 'colors.dart';

/// служебный класс для темы приложения

enum MyThemeKeys {LIGHTFC, DARKFC}

class MyThemes {


  static final ThemeData lightThemeFcNnFonts = ThemeData(
    //Цвет фона для основных частей приложения (панели инструментов, панели вкладок и т. Д.)
    primaryColor: mainbackgroundlight,
    //Более темная версия primaryColor .
    primaryColorDark: mainbackgroundlight,
    //Цвет, который контрастирует с primaryColor , например, используется в качестве оставшейся части индикатора выполнения.
    backgroundColor: mainbackgroundlight,
    //не понятно пока
    accentColor: activbottombariconlight,
    //основной задний цвет
    scaffoldBackgroundColor: mainbossOfLifeAppBackground,
    //цвет фона диалоговых окон
    dialogBackgroundColor: Colors.orange,
    //яркость темы
    brightness: Brightness.light,
    //цвет контейнеров и основных боксов
    cardColor: boxlight,

    appBarTheme: AppBarTheme(
      elevation: 0,
      color: mainbackgroundlight,
        iconTheme: IconThemeData(color: Colors.white)

    ),
    textTheme: TextTheme(
      // Самый маленький стиль
      overline: TextStyle(color: Color(0xFF818C99), fontFamily: "Roboto",fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,letterSpacing: -0.08 ),

      //Используется для кнопок .
      button: TextStyle(color: Colors.white, fontFamily: "Roboto",fontSize: 15,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal,letterSpacing: -0.24 ),

      //Используется для вспомогательного текста, связанного с изображениями.
      caption: TextStyle(color: redSelected, fontFamily: "Roboto",fontSize: 16 ),

      //Используется для основного текста в списках (например, ListTile.title )(цифра рейтинга в сообщениях)
      subtitle1: TextStyle(color: mainbossTextGrey, fontSize: 12,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500, fontFamily: "Exo",),

      //Для среднего выделения текста, который немного меньше, чем subtitle1()(текст выделенный чуть больше чем основное например в плашке вопроса"answrs")
      subtitle2: TextStyle(color: mainbossTextGrey, fontFamily: "Roboto",fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),

      //Используется для выделения текста, который иначе был бы bodyText2(для выделенного текста напиример имя в плашке вопроса)
      bodyText1: TextStyle(color: mainbossTextDarkGrey, fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500, fontStyle: FontStyle.normal
      ),

      //Стиль текста по умолчанию для материала(для основного текста)
      bodyText2: TextStyle(color: mainbossTextGrey, fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.w400, fontStyle: FontStyle.normal,letterSpacing: -0.24
      ),

      //Чрезвычайно большой текст.(у нас заголовки в QATabBar(белый текст))
      headline1: TextStyle(
        fontSize: 32,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        color: mainbossTextDialogWhite,
      ),

      //Очень и очень большой текст(синий текст 2D)
      headline2: TextStyle(
        color: mainbossTextBlue2,
        fontSize: 18,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),

      //Очень большой текст.(Cветло серый текст , например сообщения)
      headline3: TextStyle(
        color: mainbossTextLightGrey,
        fontSize: 15,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),

      //Большой текст.(черный текст)
      headline4: TextStyle(
        color: mainbossTextCalendar,
        fontSize: 17,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontFamily: "Roboto",
      ),

      //Используется для большого текста в диалоговых окнах (например, месяц и год
      // в диалоговом окне, отображаемом showDatePicker )
      headline5: TextStyle(
          fontSize: 17,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontFamily: "Roboto",
          color: Colors.black,
          letterSpacing: -0.41
      ),

      //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
      headline6: TextStyle(
        fontSize: 21,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    ),

    primaryIconTheme: IconThemeData(color: appbartexstlight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF99A2AD),
      ),
      unselectedItemColor: Color(0xFF99A2AD),
      selectedItemColor: Color(0xFF00A0D8),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color(0xFF00A0D8),
      ),
    ),




    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF818C99),
        ),
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: "Roboto",
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
        labelColor: Color(0xFF000000),
        unselectedLabelColor: Color(0xFF818C99)),
  );


  static final ThemeData darkThemeFcNnFonts = ThemeData(
    //Цвет фона для основных частей приложения (панели инструментов, панели вкладок и т. Д.)
    primaryColor: mainbackgroundlight,
    //Более темная версия primaryColor .
    primaryColorDark: mainbackgroundlight,
    //Цвет, который контрастирует с primaryColor , например, используется в качестве оставшейся части индикатора выполнения.
    backgroundColor: mainbackgroundlight,
    //не понятно пока
    accentColor: activbottombariconlight,
    //основной задний цвет
    scaffoldBackgroundColor: mainbackgroundlight,
    //цвет фона диалоговых окон
    dialogBackgroundColor: Colors.orange,
    //яркость темы
    brightness: Brightness.light,
    //цвет контейнеров и основных боксов
    cardColor: boxlight,

    appBarTheme: AppBarTheme(
      elevation: 0,
      color: mainbackgroundlight,
    ),
    textTheme: TextTheme(
      // Самый маленький стиль
      overline: TextStyle(color: redSelected, fontFamily: "Roboto",fontSize: 16 ),

      //Используется для текста на ElevatedButton , TextButton и OutlinedButton .
      button: TextStyle(color: redSelected, fontFamily: "Roboto",fontSize: 16 ),

      //Используется для вспомогательного текста, связанного с изображениями.
      caption: TextStyle(color: redSelected, fontFamily: "Roboto",fontSize: 16 ),

      //Используется для основного текста в списках (например, ListTile.title ).
      subtitle1: TextStyle(color: appbartexstlight, fontSize: 20),

      //Для среднего выделения текста, который немного меньше, чем subtitle1
      subtitle2: TextStyle(color: appbartexstlight, fontSize: 20),

      //Используется для выделения текста, который иначе был бы bodyText2 .
      bodyText1: TextStyle(color: greytextbodylight,
        fontSize: 14,
        fontFamily: "Roboto",
      ),

      //Стиль текста по умолчанию для материала .
      bodyText2: TextStyle(color: Colors.black,
        fontSize: 14,
        fontFamily: "Roboto",
      ),

      //Чрезвычайно большой текст.
      headline1: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),

      //Очень и очень большой текст
      headline2: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),

      //Очень большой текст.
      headline3: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),

      //Большой текст.
      headline4: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),

      //Используется для большого текста в диалоговых окнах (например, месяц и год в диалоговом окне, отображаемом showDatePicker ).
      headline5: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),

      //Используется для основного текста на панелях приложений и в диалоговых окнах (например, AppBar.title и AlertDialog.title ).
      headline6: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
        color: appbartexstlight,
      ),
    ),

    primaryIconTheme: IconThemeData(color: appbartexstlight),
    tabBarTheme: TabBarTheme(
        unselectedLabelStyle: TextStyle(color: noactivbottombariconlight),
        labelStyle: TextStyle(color: activbottombariconlight),
        labelColor: activbottombariconlight,
        unselectedLabelColor: noactivbottombariconlight),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHTFC:
        return lightThemeFcNnFonts;
      case MyThemeKeys.DARKFC:
        return darkThemeFcNnFonts;
      default:
        return lightThemeFcNnFonts;
    }
  }
}
