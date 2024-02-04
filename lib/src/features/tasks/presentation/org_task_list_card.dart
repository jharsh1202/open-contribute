import 'package:flutter/material.dart';

class OrganizationCard extends StatelessWidget {
  final String title;
  final String logoPath;
  final String tag1;
  final String tag2;
  final String description;
  final double donationProgress;
  final int donationAmount;

  OrganizationCard({
    required this.title,
    required this.logoPath,
    required this.tag1,
    required this.tag2,
    required this.description,
    required this.donationProgress,
    required this.donationAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  logoPath,
                  width: 70,
                  height: 60,
                ), // Adjust size as needed,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign:
                              TextAlign.start, // Align the text to the center
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(tag1,
                                      style: TextStyle(fontSize: 12)),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(tag2,
                                      style: TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(description, textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "0",
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Text(
                    "$donationAmount",
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            LinearProgressIndicator(
              value: donationProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //     'Donation Progress: ${(donationProgress * 100).toStringAsFixed(0)}%'),
          ],
        ),
      ),
    );
  }
}
