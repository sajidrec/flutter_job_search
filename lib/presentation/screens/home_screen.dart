import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_search/data/models/job_data_model.dart';
import 'package:job_search/presentation/providers/job_list_provider.dart';
import 'package:job_search/presentation/providers/user_credential_provider.dart';
import 'package:job_search/presentation/screens/all_popular_job_list_screen.dart';
import 'package:job_search/presentation/screens/job_details_screen.dart';
import 'package:job_search/presentation/screens/update_profile_screen.dart';
import 'package:job_search/presentation/utils/app_colors.dart';
import 'package:job_search/presentation/widgets/job_card_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _searchTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<JobListProvider>(context, listen: false).requestJobList(
          keyword: "Popular",
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<UserCredentialProvider>(context, listen: false)
            .requestUserInfo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: _buildHeaderSection(context),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildSearchBox(),
              ),
              const SizedBox(height: 18),
              _buildJobCategorySection(context),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildPopularSection(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Popular",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  EdgeInsets.zero,
                ),
                overlayColor: WidgetStateProperty.all(
                  AppColors.primaryShade.withOpacity(0.2),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllPopularJobListScreen(),
                  ),
                );
              },
              child: Text(
                "View all",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
        const SizedBox(height: 14),
        Consumer<JobListProvider>(
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
                      imageUrl: popularJobProvider
                              .jobList.data?[index].employerLogo ??
                          "",
                      jobTitle:
                          popularJobProvider.jobList.data?[index].jobTitle ??
                              "",
                      companyName: popularJobProvider
                              .jobList.data?[index].jobPublisher ??
                          "",
                      datePosted: DateFormat('dd-MM-yyyy - kk:mm a').format(
                        DateTime.parse(
                          popularJobProvider.jobList.data?[index]
                                  .jobPostedAtDatetimeUtc ??
                              DateTime.now().toString(),
                        ).toLocal(),
                      ),
                      onTapFunction: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailsScreen(
                              jobDetails:
                                  popularJobProvider.jobList.data?[index] ??
                                      JobDataModel(),
                            ),
                          ),
                        );
                      },
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount:
                        (popularJobProvider.jobList.data?.length ?? 0) > 4
                            ? 4
                            : (popularJobProvider.jobList.data?.length ?? 0),
                  );
          },
        ),
      ],
    );
  }

  Widget _buildJobCategorySection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Job Category",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 45,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.primaryShade,
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    AppColors.textWhite,
                  ),
                  overlayColor: WidgetStateProperty.all(
                    AppColors.primary.withOpacity(0.2),
                  ),
                ),
                child: const Text(
                  "Design",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            textInputAction: TextInputAction.search,
            controller: _searchTEController,
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.textWhite,
                ),
              ),
            ),
            onFieldSubmitted: (value) {},
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRemoteOnlyDropdown(),
              _buildJobPostTimeDropdown(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobPostTimeDropdown() {
    return DropdownButton<String>(
      dropdownColor: AppColors.primaryShade,
      borderRadius: BorderRadius.circular(12),
      iconEnabledColor: AppColors.textWhite,
      value: "all",
      items: const [
        DropdownMenuItem(
          value: "all",
          child: Text("All"),
        ),
        DropdownMenuItem(
          value: "today",
          child: Text("Today"),
        ),
        DropdownMenuItem(
          value: "3days",
          child: Text("3 Days"),
        ),
        DropdownMenuItem(
          value: "week",
          child: Text("Week"),
        ),
        DropdownMenuItem(
          value: "month",
          child: Text("Month"),
        ),
      ],
      onChanged: (value) {},
    );
  }

  Widget _buildRemoteOnlyDropdown() {
    return DropdownButton<bool>(
      dropdownColor: AppColors.primaryShade,
      iconEnabledColor: AppColors.textWhite,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      hint: const Text(
        "Job Type",
        style: TextStyle(
          color: AppColors.textWhite,
        ),
      ),
      borderRadius: BorderRadius.circular(12),
      value: false,
      items: const [
        DropdownMenuItem<bool>(
          value: true,
          child: Text(
            "Remote Only",
            style: TextStyle(),
          ),
        ),
        DropdownMenuItem(
          value: false,
          child: Text("Any Type"),
        ),
      ],
      onChanged: (value) {},
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(
        AppColors.primaryShade.withOpacity(0.2),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen(
              fullName: "MD. Sajid Hossain",
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.secondary,
                minRadius: 40,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white38,
                        ),
                  ),
                  Consumer<UserCredentialProvider>(
                      builder: (context, user, child) {
                    // user.requestUserInfo();
                    return Text(
                      user.userInfo.name ?? "Unknown",
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }),
                ],
              )
            ],
          ),
          const Icon(
            Icons.edit,
            color: AppColors.textWhite,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchTEController.dispose();
  }
}
