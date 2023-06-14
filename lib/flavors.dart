enum Flavor {
  dev,
  stage,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'PixelField Test Dev';
      case Flavor.stage:
        return 'PixelField Test Stage';
      case Flavor.prod:
        return 'PixelField Test';
      default:
        return 'title';
    }
  }

}
