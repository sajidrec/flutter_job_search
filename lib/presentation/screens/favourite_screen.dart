import 'package:flutter/material.dart';
import 'package:job_search/presentation/screens/job_details_screen.dart';
import 'package:job_search/presentation/widgets/job_card_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
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
                      "Favourite Job Posts",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => JobCardWidget(
                    context: context,
                    imageUrl:
                        'https://w7.pngwing.com/pngs/63/1016/png-transparent-google-logo-google-logo-g-suite-chrome-text-logo-chrome.png',
                    jobTitle: 'UI/UX Designer',
                    companyName: 'Google',
                    datePosted: '20/12/2020',
                    onTapFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JobDetailsScreen(),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
