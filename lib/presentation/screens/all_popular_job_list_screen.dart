import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search/data/models/job_data_model.dart';
import 'package:job_search/presentation/providers/job_list_provider.dart';
import 'package:job_search/presentation/screens/job_details_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/widgets/job_card_widget.dart';
import 'package:provider/provider.dart';

class AllPopularJobListScreen extends StatelessWidget {
  const AllPopularJobListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Popular Job Posts",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                buildPopularJobList(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer<JobListProvider> buildPopularJobList() {
    return Consumer<JobListProvider>(
      builder: (context, popularJobProvider, child) {
        return popularJobProvider.inProgress
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondary,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => JobCardWidget(
                  context: context,
                  imageUrl:
                      popularJobProvider.jobList.data?[index].employerLogo ??
                          "",
                  jobTitle:
                      popularJobProvider.jobList.data?[index].jobTitle ?? "",
                  companyName:
                      popularJobProvider.jobList.data?[index].jobPublisher ??
                          "",
                  datePosted: DateFormat('dd-MM-yyyy - kk:mm a').format(
                    DateTime.parse(
                      popularJobProvider
                              .jobList.data?[index].jobPostedAtDatetimeUtc ??
                          DateTime.now().toString(),
                    ).toLocal(),
                  ),
                  onTapFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailsScreen(
                          jobDetails: popularJobProvider.jobList.data?[index] ??
                              JobDataModel(),
                        ),
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: popularJobProvider.jobList.data?.length ?? 0,
              );
      },
    );
  }
}
