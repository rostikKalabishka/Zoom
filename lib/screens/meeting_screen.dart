import 'dart:math';

import 'package:flutter/material.dart';

import '../resources/jitsi_meet_service.dart';
import '../widgets/home_meet_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetService _jitsiMeetService = JitsiMeetService();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetService.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

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
                  onPressed: createNewMeeting,
                  text: 'Create Meet',
                ),
                HomeMeetButton(
                  icon: Icons.add_box_rounded,
                  onPressed: () => joinMeeting(context),
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
              'Create/Join Meetings with just click!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )))
          ],
        ),
      ),
    );
  }
}
