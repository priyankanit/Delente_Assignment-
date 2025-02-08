import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'settings': 'Settings',
          'dark_mode': 'Dark Mode',
          'language': 'Language',
          'signin_google': 'Sign in with Google',
          'signin_facebook': 'Sign in with Facebook',
          'userinfo': 'User Info',
          'name': 'Name: :name',
          'email': 'Email: :email',
        },
        'es_ES': {
          'settings': 'Configuraciones',
          'dark_mode': 'Modo Oscuro',
          'language': 'Idioma',
          'signin_google': 'Iniciar sesión con Google',
          'signin_facebook': 'Iniciar sesión con Facebook',
          'userinfo': 'Información del usuario',
          'name': 'Nombre: :name',
          'email': 'Correo electrónico: :email',
        },
        'fr_FR': {
          'settings': 'Paramètres',
          'dark_mode': 'Mode Sombre',
          'language': 'Langue',
          'signin_google': 'Se connecter avec Google',
          'signin_facebook': 'Se connecter avec Facebook',
          'userinfo': "Infos de l'utilisateur",
          'name': 'Nom: :name',
          'email': 'E-mail: :email',
        },
      };
}
