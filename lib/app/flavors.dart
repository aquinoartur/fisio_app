enum FlavorTypes { user, adm }

class Flavor {
  Flavor._instance();

  static FlavorTypes? flavorType;

  static String get flavorMessage {
    switch (flavorType) {
      case FlavorTypes.user:
        return 'User';
      case FlavorTypes.adm:
        return 'Adm';
      default:
        return 'User';
    }
  }

  static bool get isUser => Flavor.flavorType == FlavorTypes.user;

  static String get urlBase {
    switch (flavorType) {
      case FlavorTypes.user:
        return urlBaseUser;
      case FlavorTypes.adm:
        return urlBaseAdm;
      default:
        return urlBaseUser;
    }
  }
}

const urlBaseUser = ''; //apis
const urlBaseAdm = '';
