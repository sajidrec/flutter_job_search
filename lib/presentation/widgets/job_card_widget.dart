import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:job_search/presentation/utils/app_colors.dart';

class JobCardWidget extends StatelessWidget {
  final String imageUrl, jobTitle, companyName, datePosted;
  final VoidCallback onTapFunction;

  const JobCardWidget({
    super.key,
    required BuildContext context,
    required this.imageUrl,
    required this.jobTitle,
    required this.companyName,
    required this.datePosted,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.primaryShade,
      child: InkWell(
        onTap: onTapFunction,
        overlayColor: WidgetStateProperty.all(
          AppColors.primaryShade.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobTitle,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              companyName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white.withOpacity(0.85),
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              datePosted,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.white70,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: FittedBox(
                  child: Icon(
                    Icons.arrow_right_alt_rounded,
                    color: AppColors.textWhite,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
