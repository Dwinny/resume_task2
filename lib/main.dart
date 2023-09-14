import 'package:flutter/material.dart';

import 'Editing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: ViewScreen());
  }
}

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  String fullName = 'Chioma Godwin';
  String slackUsername = 'Dwinny';
  String githubHandle = 'dwinny';
  String personalBio = 'Flutter Developer';

  void update(String name, String slack, String github, String bio) {
    setState(() {
      fullName = name;
      slackUsername = slack;
      githubHandle = github;
      personalBio = bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CV View')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'PERSONAL INFORMATION',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Full Name: $fullName',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Slack Username: $slackUsername',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Github Handle: $githubHandle',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Brief Personal Bio: $personalBio',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditingPage(
                        fullname: fullName,
                        slackUsername: slackUsername,
                        githubHandle: githubHandle,
                        bio: personalBio,
                        updateCV: update,
                      );
                    }));
                  },
                  child: Text(
                    'EDIT CV',
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 14),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
