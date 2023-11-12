import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
// import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom/resources/auth_service.dart';

class JitsiMeetService {
  final AuthService _authService = AuthService();
  List<String> participants = [];
  final _jitsiMeetPlugin = JitsiMeet();
  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    String name;
    if (username.isEmpty) {
      name = _authService.user.displayName!;
    } else {
      name = username;
    }
    // Map<String, Object?> featureFlags = {'welcomePageEnabled ': false};
    JitsiMeetConferenceOptions options = JitsiMeetConferenceOptions(
      room: roomName,
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoMuted,
      },
      userInfo: JitsiMeetUserInfo(
          avatar: _authService.user.photoURL,
          email: _authService.user.email,
          displayName: name),
      featureFlags: {
        "unsaferoomwarning.enabled": true,
        // "ios.screensharing.enabled": true
      },
    );

    debugPrint("JitsiMeetingOptions: $options");
    await _jitsiMeetPlugin.join(
      options,
      JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("conferenceJoined: url: $url");
        },
        conferenceTerminated: (url, error) {
          debugPrint("conferenceTerminated: url: $url, error: $error");
        },
        conferenceWillJoin: (url) {
          debugPrint("conferenceWillJoin: url: $url");
        },
        participantJoined: (email, name, role, participantId) {
          debugPrint(
            "participantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
          participants.add(participantId!);
        },
        participantLeft: (participantId) {
          debugPrint("participantLeft: participantId: $participantId");
        },
        audioMutedChanged: (muted) {
          debugPrint("audioMutedChanged: isMuted: $muted");
        },
        videoMutedChanged: (muted) {
          debugPrint("videoMutedChanged: isMuted: $muted");
        },
        endpointTextMessageReceived: (senderId, message) {
          debugPrint(
              "endpointTextMessageReceived: senderId: $senderId, message: $message");
        },
        screenShareToggled: (participantId, sharing) {
          debugPrint(
            "screenShareToggled: participantId: $participantId, "
            "isSharing: $sharing",
          );
        },
        chatMessageReceived: (senderId, message, isPrivate, timestamp) {
          debugPrint(
            "chatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate, timestamp: $timestamp",
          );
        },
        chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
        participantsInfoRetrieved: (participantsInfo) {
          debugPrint(
              "participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
        },
        readyToClose: () {
          debugPrint("readyToClose");
        },
      ),
    );
  }
}
