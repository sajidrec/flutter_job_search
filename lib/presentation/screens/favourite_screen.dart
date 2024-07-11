import 'package:flutter/material.dart';
import 'package:job_search/presentation/providers/favourite_job_provider.dart';
import 'package:job_search/presentation/providers/main_bottom_nav_screen_provider.dart';
import 'package:job_search/presentation/screens/job_details_screen.dart';
import 'package:job_search/presentation/screens/main_bottom_nav_screen.dart';
import 'package:job_search/presentation/widgets/job_card_widget.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<FavouriteJobProvider>(context, listen: false)
            .requestFavouriteJobList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Provider.of<MainBottomNavScreenProvider>(context, listen: false)
            .setCurrentIndex = 0;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const MainBottomNavScreen(),
          ),
          (route) => false,
        );
      },
      child: Scaffold(
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
                        "Favourite Job Posts",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Consumer<FavouriteJobProvider>(
                      builder: (context, favouriteJobProvider, child) {
                    return favouriteJobProvider.getFavJobList.isEmpty
                        ? const Center(
                            child: Text(
                              "You don't have any favourite job",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) => JobCardWidget(
                              context: context,
                              imageUrl: favouriteJobProvider
                                      .getFavJobList[index].employerLogo ??
                                  "",
                              jobTitle: favouriteJobProvider
                                      .getFavJobList[index].jobTitle ??
                                  "",
                              companyName: favouriteJobProvider
                                      .getFavJobList[index].employerName ??
                                  "",
                              datePosted: favouriteJobProvider
                                      .getFavJobList[index]
                                      .jobPostedAtDatetimeUtc ??
                                  "",
                              onTapFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetailsScreen(
                                      jobDetails: favouriteJobProvider
                                          .getFavJobList[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            itemCount:
                                favouriteJobProvider.getFavJobList.length,
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
