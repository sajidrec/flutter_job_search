import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/auth_providers/logout_provider.dart';
import 'package:job_search/presentation/providers/user_credential_provider.dart';
import 'package:job_search/presentation/screens/auth_screens/signup_or_login_screen.dart';
import 'package:job_search/presentation/screens/update_profile_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildHeaderEditSection(context),
                const SizedBox(height: 12),
                _buildLogoutButton(context: context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton({required BuildContext context}) {
    return SizedBox(
      width: double.maxFinite,
      child:
          Consumer<LogoutProvider>(builder: (context, logoutProvider, child) {
        return FilledButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.primaryShade),
          ),
          onPressed: () async {
            await logoutProvider.logout();

            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupOrLoginScreen(),
                ),
                (route) => false,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Logout",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildHeaderEditSection(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondary,
              minRadius: 50,
              child: Text(
                "?",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<UserCredentialProvider>(
                    builder: (context, user, child) {
                  return Text(
                    user.getUserInfo()?.displayName ?? "Unknown",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                }),
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
