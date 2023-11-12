import 'package:flutter/material.dart';

import '../widgets/home_meet_button.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetButton(
                  icon: Icons.videocam,
                  onPressed: () {},
                  text: 'Create Meet',
                ),
                HomeMeetButton(
                  icon: Icons.add_box_rounded,
                  onPressed: () {},
                  text: 'Join Meeting',
                ),
                HomeMeetButton(
                  icon: Icons.calendar_today,
                  onPressed: () {},
                  text: 'Schedule',
                ),
                HomeMeetButton(
                  icon: Icons.arrow_upward,
                  onPressed: () {},
                  text: 'Share Screen',
                )
              ],
            ),
            const Expanded(
                child: Center(
                    child: Text(
              'History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )))
          ],
        ),
      ),
    );
  }
}
