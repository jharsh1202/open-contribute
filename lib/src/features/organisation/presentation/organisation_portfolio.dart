import 'package:flutter/material.dart';

class OrganizationPortfolioScreen extends StatefulWidget {
  @override
  _OrganizationPortfolioScreenState createState() =>
      _OrganizationPortfolioScreenState();
}

class _OrganizationPortfolioScreenState
    extends State<OrganizationPortfolioScreen> {
  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample Non-Profit Organisation'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/org1.jpeg',
              width: MediaQuery.of(context).size.width,
              height: 150,
            ),
            SizedBox(height: 10),
            Text("Contribution Distribution", textAlign: TextAlign.center),
            SizedBox(height: 10),
            ContributionDistributionStats(
              showAllItems: showAllItems,
              toggleShowAllItems: () {
                setState(() {
                  showAllItems = !showAllItems;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContributionDistributionStats extends StatefulWidget {
  final bool showAllItems;
  final VoidCallback toggleShowAllItems;

  ContributionDistributionStats({
    required this.showAllItems,
    required this.toggleShowAllItems,
  });

  @override
  _ContributionDistributionStatsState createState() =>
      _ContributionDistributionStatsState();
}

class _ContributionDistributionStatsState
    extends State<ContributionDistributionStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: widget.showAllItems ? 12 : 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: StatsObject(
                    count: index + 10, description: "Category $index"),
              );
            },
          ),
          TextButton(
            onPressed: widget.toggleShowAllItems,
            child: Text(widget.showAllItems ? "Minimize" : "View More"),
          ),
        ],
      ),
    );
  }
}

class StatsObject extends StatelessWidget {
  final String description;
  final int count;
  const StatsObject({
    super.key,
    required this.description,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Expanded(
              child: CircularCountProgress(
            count: count,
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Text(
              "$description",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularCountProgress extends StatelessWidget {
  final int count;
  final double size;
  final Color color;

  CircularCountProgress({
    required this.count, //this has @required instead
    this.size = 100.0,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                value: count / 100, // Assuming count is a percentage
                // strokeWidth: 5.0,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$count%',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageGridItem extends StatelessWidget {
  //NGO tasks wallpapers square, on click shows detailed stats and data
  final String imageUrl;
  final VoidCallback onPressedFavorite;

  const ImageGridItem({
    Key? key,
    required this.imageUrl,
    required this.onPressedFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/org1.jpeg',
          width: 70,
          height: 60,
        ),
      ],
    );
  }
}
