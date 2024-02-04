import 'package:flutter/material.dart';
import 'package:clearcontributions/src/features/tasks/presentation/org_task_list_card.dart';
import 'package:clearcontributions/src/features/tasks/presentation/org_task_detail.dart';

class OrganizationListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          10, // Assuming organizations.length, // Assuming organizations is a list of data
      itemBuilder: (BuildContext context, int index) {
        // Assuming each organization in the list has the required data
        // final organization = organizations[index];
        // return OrganizationCard(
        //   logoPath: organization.logoPath,
        //   tag1: organization.tag1,
        //   tag2: organization.tag2,
        //   description: organization.description,
        //   donationProgress: organization.donationProgress,
        // );

        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 1, 5, 0),
          child: GestureDetector(
            onTap: () {
              // Navigate to the new screen when the card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContributionBreakup(
                    logoPath: 'assets/images/org1.jpeg',
                    title: 'Sample Non-Profit Organisation',
                    tag1: 'Education',
                    tag2: 'Food',
                    description:
                        'We need funds to pay get meals for students at our offline classes.',
                    // donationProgress: 0.1 * index,
                  ),
                ),
              );
            },
            child: OrganizationCard(
              logoPath: 'assets/images/org1.jpeg',
              title: 'Sample Non-Profit Organisation',
              tag1: 'Education',
              tag2: 'Food',
              description:
                  'We need funds to pay get meals for students at our offline classes.',
              donationProgress: 0.1 * index,
              donationAmount: 1000 * index,
            ),
          ),
        );
      },
    );
  }
}
