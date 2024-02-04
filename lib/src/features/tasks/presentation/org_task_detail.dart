import 'package:flutter/material.dart';
import 'package:clearcontributions/src/features/organisation/presentation/organisation_portfolio.dart';
import 'package:clearcontributions/src/features/donate/presentation/donate.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        toggleFavorite();
      },
      icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
      label: Text(isFavorite ? 'Remove' : 'Add'),
    );
  }
}

class ContributionBreakup extends StatelessWidget {
  final String title;
  final String logoPath;
  final String tag1;
  final String tag2;
  final String description;

  ContributionBreakup({
    required this.title,
    required this.logoPath,
    required this.tag1,
    required this.tag2,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Display contribution details
                CauseDescription(
                  logoPath: logoPath,
                  title: title,
                  tag1: tag1,
                  tag2: tag2,
                  description: description,
                ),
                // Display contribution progress
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ContributionProgress(
                      title: "Rotis $index",
                      donationProgress: 0.1 * index,
                      description:
                          "there's a lot to say about this need!\nthere's really a lot to say about this need!",
                    );
                  },
                ),
                // Display action buttons
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => Placeholder()),
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrganizationPortfolioScreen()),
                        );
                        // Add onPressed logic
                      },
                      child: Text('Org Detail'),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => Placeholder()),
                          MaterialPageRoute(
                              builder: (context) => DonationScreen()),
                        );
                        // Add onPressed logic
                      },
                      child: Text('Contribute'),
                    ),
                    Spacer(),
                    FavoriteButton(), // Favorite button widget
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CauseDescription extends StatelessWidget {
  const CauseDescription({
    Key? key,
    required this.logoPath,
    required this.title,
    required this.tag1,
    required this.tag2,
    required this.description,
    // required this.donationProgress,
  }) : super(key: key);

  final String logoPath;
  final String title;
  final String tag1;
  final String tag2;
  final String description;
  // final double donationProgress;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                logoPath,
                width: 70,
                height: 60,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          _buildTag(tag1),
                          _buildTag(tag2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(tag, style: TextStyle(fontSize: 12)),
    );
  }
}

class ContributionProgress extends StatefulWidget {
  const ContributionProgress({
    Key? key,
    required this.title,
    required this.donationProgress,
    required this.description,
  }) : super(key: key);

  final String title;
  final double donationProgress;
  final String description;

  @override
  _ContributionProgressState createState() => _ContributionProgressState();
}

class _ContributionProgressState extends State<ContributionProgress> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "0",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "6,000",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              LinearProgressIndicator(
                value: widget.donationProgress,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showFullDescription = !showFullDescription;
                  });
                },
                child: Text(
                  widget.description,
                  maxLines: showFullDescription ? null : 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              if (!showFullDescription)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showFullDescription = true;
                    });
                  },
                  child: Text(
                    'View more',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
