import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/home_meet_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexPage = 0;
  onPageChanged(int indexPage) {
    setState(() {
      _indexPage = indexPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text('Meet & Chat'),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          backgroundColor: footerColor,
          currentIndex: _indexPage,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: 'Meet & Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meeting',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ]),
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
            'Create/Join Meetings with just click!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )))
        ],
      )),
    );
  }
}
