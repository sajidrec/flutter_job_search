import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/auth_providers/create_account_email_and_pass_provider.dart';
import 'presentation/providers/auth_providers/login_provider.dart';
import 'presentation/providers/main_bottom_nav_screen_provider.dart';
import 'presentation/providers/password_obscure_provider.dart';

class ChangeNotifierProviderList {
  static dynamic getList() => [
        ChangeNotifierProvider(
          create: (context) => PasswordObscureProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainBottomNavScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreateAccountEmailAndPassProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ];
}
