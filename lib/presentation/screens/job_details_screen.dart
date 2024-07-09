import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search/data/models/job_data_model.dart';
import 'package:job_search/presentation/providers/favourite_job_provider.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:provider/provider.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({
    required this.jobDetails,
    super.key,
  });

  final JobDataModel jobDetails;

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
                          imageUrl: jobDetails.employerLogo ?? "",
                          jobTitle: jobDetails.jobTitle ?? "Unknown",
                          companyName: jobDetails.employerName ?? "Unknown",
                          website: jobDetails.employerWebsite ?? "",
                          jobDetails: jobDetails,
                        ),
                        const SizedBox(height: 16),
                        _buildJobTypeDescription(
                          jobDetails: jobDetails,
                          context,
                        ),
                        const SizedBox(height: 16),
                        _buildJobDescriptionAndRequirements(
                          context: context,
                          jobDescription:
                              jobDetails.jobDescription ?? "Not Available",
                          jobRequirements:
                              getJobRequirementString(jobDetails) ??
                                  "Not mentioned",
                        ),
                        const SizedBox(
                          height: 150,
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

  Widget _buildJobTypeDescription(
    BuildContext context, {
    required JobDataModel jobDetails,
  }) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),

      children: [
        _buildJobStatusChip(
          context: context,
          statusTypeName: "Job Type",
          status: jobDetails.jobEmploymentType ?? "N/A",
        ),
        _buildJobStatusChip(
          context: context,
          statusTypeName: "Remote Job",
          status: (jobDetails.jobIsRemote ?? false) ? "YES" : "NO",
        ),
        _buildJobStatusChip(
          context: context,
          statusTypeName: "City",
          status: jobDetails.jobCity ?? "N/A",
        ),
        _buildJobStatusChip(
          context: context,
          statusTypeName: "Expire Date",
          status: (jobDetails.jobOfferExpirationDatetimeUtc == null)
              ? "N/A"
              : DateFormat('dd-MM-yyyy - hh:mm a').format(
                  DateTime.parse(
                    jobDetails.jobOfferExpirationDatetimeUtc ?? "",
                  ),
                ),
        ),
      ],
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
    required JobDataModel jobDetails,
  }) {
    return SizedBox(
      child: Row(
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
                  fit: BoxFit.fill,
                  height: 90,
                  width: 90,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.broken_image_rounded,
                    size: 50,
                    color: AppColors.textWhite,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: Text(
                    jobTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Center(
                  child: Text(
                    companyName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.textWhite.withOpacity(
                            0.9,
                          ),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                website,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.blue,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Consumer<FavouriteJobProvider>(
              builder: (context, favouriteJobProvider, child) {
            return IconButton(
              onPressed: () async {
                favouriteJobProvider.addToFavourite(jobDetails: jobDetails);
              },
              icon: const Icon(
                Icons.favorite_outline_rounded,
              ),
            );
          }),
        ],
      ),
    );
  }

  String? getJobRequirementString(JobDataModel jobDetails) {
    String? result;
    for (int i = 0;
        i < (jobDetails.jobHighlights?.qualifications?.length ?? 0);
        i++) {
      if (jobDetails.jobHighlights?.qualifications?[i] != null ||
          jobDetails.jobHighlights?.qualifications?[i] != "") {
        if (result != null) {
          result += "${i + 1}. ";
          result += jobDetails.jobHighlights?.qualifications?[i] ?? "";
          result += "\n";
        } else {
          result = "${i + 1}. ";
          result += jobDetails.jobHighlights?.qualifications?[i] ?? "";
          result += "\n";
        }
      }
    }
    return result;
  }
}
