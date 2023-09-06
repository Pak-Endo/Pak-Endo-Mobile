import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineWidget extends StatelessWidget {
  final List<TimelineItem> items;

  CustomTimelineWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in items)
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(
              width: 40,
              color: Colors.green, // Customize the circle color
              padding: EdgeInsets.all(8),
              indicator: _buildFilledCircle(),
            ),
            startChild: _buildTimelineTitle(item.title),
            endChild: _buildContent(item.content),
          ),
      ],
    );
  }

  Widget _buildFilledCircle() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green, // Same color as the indicatorStyle
      ),
    );
  }

  Widget _buildTimelineTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildContent(String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(content),
    );
  }
}

class TimelineItem {
  final String title;
  final String content;

  TimelineItem({required this.title, required this.content});
}
