import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widgets/meeting_option.dart';

import '../resources/auth_service.dart';
import '../resources/jitsi_meet_service.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthService _authService = AuthService();
  final JitsiMeetService _jitsiMeetService = JitsiMeetService();
  late TextEditingController roomController;
  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    roomController = TextEditingController();
    nameController = TextEditingController(text: _authService.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    roomController.dispose();
    nameController.dispose();
    super.dispose();
  }

  _joinMeeting() {
    _jitsiMeetService.createMeeting(
        roomName: roomController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              controller: roomController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Room ID',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn Off My Video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  void onAudioMuted(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  void onVideoMuted(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }
}
