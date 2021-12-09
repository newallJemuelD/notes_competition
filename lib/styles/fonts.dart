part of styles;

class AppFont {
  static TextStyle getAppFont(
      {FontWeight? fontWeight, double? fontSize, Color? color}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}

class HeaderFonts {
  static TextStyle primaryFont = AppFont.getAppFont(
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  static TextStyle secondaryFont = AppFont.getAppFont(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black,
  );
  static TextStyle tertiaryFont = AppFont.getAppFont(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
  );
}

class TextFonts {
  static TextStyle primaryFont = AppFont.getAppFont(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Colors.black,
  );
  static TextStyle secondaryFont = AppFont.getAppFont(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black,
  );
}
