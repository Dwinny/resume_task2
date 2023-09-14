import 'package:flutter/material.dart';

class EditingPage extends StatefulWidget {
  final Function(String, String, String, String) updateCV;
  final String fullname;
  final String slackUsername;
  final String githubHandle;
  final String bio;

  const EditingPage(
      {super.key,
      required this.bio,
      required this.fullname,
      required this.githubHandle,
      required this.slackUsername,
      required this.updateCV});

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  TextEditingController name = TextEditingController();

  TextEditingController slack = TextEditingController();

  TextEditingController github = TextEditingController();

  TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = widget.fullname;
    slack.text = widget.slackUsername;
    github.text = widget.githubHandle;
    bio.text = widget.bio;

    return Scaffold(
      appBar: AppBar(
        title: Text('EDITING PAGE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: slack,
              decoration: InputDecoration(labelText: 'Slack Username'),
            ),
            TextField(
              controller: github,
              decoration: InputDecoration(labelText: 'Github Handle'),
            ),
            TextField(
              controller: bio,
              decoration: InputDecoration(labelText: 'Personal Bio'),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    widget.updateCV(
                        name.text, slack.text, github.text, bio.text);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Update CV',
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 14),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
