import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_search/presentation/utils/app_colors.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderSection(
                          context: context,
                          imageUrl:
                              'https://w7.pngwing.com/pngs/63/1016/png-transparent-google-logo-google-logo-g-suite-chrome-text-logo-chrome.png',
                          jobTitle: "Programmer",
                          companyName: "Google",
                          website: "www.google.com",
                        ),
                        const SizedBox(height: 16),
                        _buildJobTypeDescription(),
                        const SizedBox(height: 16),
                        _buildJobDescriptionAndRequirements(
                          context: context,
                          jobDescription:
                              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiaLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime ",
                          jobRequirements:
                              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitiaLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime",
                        )
                      ],
                    ),
                  ),
                ),
              ),
              _buildFloatingApplyNowButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildJobDescriptionAndRequirements({
    required BuildContext context,
    required String jobDescription,
    required String jobRequirements,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Job Description",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          jobDescription,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          "Requirements",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          jobRequirements,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildJobTypeDescription() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) => _buildJobStatusChip(
        context: context,
        statusTypeName: "Job Type",
        status: "Remote/Hybrid",
      ),
    );
  }

  Widget _buildJobStatusChip({
    required BuildContext context,
    required String statusTypeName,
    required String status,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.textWhite.withOpacity(
              0.21,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              statusTypeName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        Text(
          status,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildFloatingApplyNowButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              AppColors.primaryShade.withOpacity(0.2),
            ),
            padding: WidgetStateProperty.all(
              const EdgeInsets.all(12),
            ),
            foregroundColor: WidgetStateProperty.all(
              AppColors.textWhite.withOpacity(0.85),
            ),
            backgroundColor: WidgetStateProperty.all(
              AppColors.secondary.withOpacity(0.7),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Apply Now",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection({
    required BuildContext context,
    required String imageUrl,
    required String jobTitle,
    required String companyName,
    required String website,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_backspace_rounded),
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: 80,
                width: 80,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              jobTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              companyName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.textWhite.withOpacity(
                      0.9,
                    ),
                  ),
            ),
            Text(
              website,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.blue,
                  ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_rounded,
          ),
        ),
      ],
    );
  }
}
