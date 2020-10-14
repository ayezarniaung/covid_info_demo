import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                _buildStatsCard(
                  title: 'Total Cases',
                  color: Colors.orange,
                  count: '1.8M',
                ),
                _buildStatsCard(
                  title: 'Deaths',
                  color: Colors.red,
                  count: '11 K',
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                _buildStatsCard(
                  title: 'Recovered',
                  color: Colors.green,
                  count: '309 K',
                ),
                _buildStatsCard(
                  title: 'Active',
                  color: Colors.lightBlue,
                  count: '1.3 M',
                ),
                _buildStatsCard(
                  title: 'Active',
                  color: Colors.purple,
                  count: '1.3 M',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard({
    String title,
    String count,
    MaterialColor color,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
