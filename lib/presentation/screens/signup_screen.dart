import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search/presentation/utils/assets_path.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                _buildScreenImageLogo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenImageLogo() {
    return Center(
      child: SvgPicture.asset(
        AssetsPath.signupImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
