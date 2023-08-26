class ImageUtils {
  static String getImages(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getIcons(String name, {String format = 'png'}) {
    return 'assets/icons/$name.$format';
  }

  static String getIconsSvg(String name, {String format = 'svg'}) {
    return 'assets/icons/$name.$format';
  }
}
