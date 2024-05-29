import 'package:flutter/material.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/center_circular_progress_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeadLogoSection(context),
            const SizedBox(height: 12),
            _buildHeaderSubSection(context),
            const SizedBox(height: 12),
            _buildLoader(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return CenterCircularProgressIndicator(
      loaderColor: AppColors.primaryShade,
      loaderBackgroundColor: AppColors.secondary,
      loaderThickness: 3.5,
    );
  }

  Widget _buildHeaderSubSection(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.textWhite,
      highlightColor: AppColors.primaryShade,
      direction: ShimmerDirection.rtl,
      period: Duration(seconds: 3),
      child: Text(
        "Develop by Sajid",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildHeadLogoSection(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryShade,
      highlightColor: AppColors.secondary,
      period: Duration(seconds: 2),
      child: Text(
        "Job Search",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
