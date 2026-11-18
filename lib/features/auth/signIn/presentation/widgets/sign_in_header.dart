import 'package:flutter/material.dart';
import 'package:invit/features/auth/widgets/auth_hero.dart';
import 'package:invit/gen/assets.gen.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  static const double _markSize = 84;

  @override
  Widget build(BuildContext context) {
    return AuthHero(
      child: Assets.icons.authBrandMark.svg(
        width: _markSize,
        height: _markSize,
      ),
    );
  }
}
