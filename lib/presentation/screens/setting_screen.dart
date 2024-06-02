import 'package:flutter/material.dart';
import 'package:job_search/presentation/screens/update_profile_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primaryShade),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Logout",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
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
                Text(
                  "Sajid Hossain",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen(
                            fullName: "MD. Sajid Hossain"),
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
