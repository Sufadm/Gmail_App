import 'package:flutter/material.dart';
import 'package:gmail_app/view/see_all_settings_page.dart';
import 'package:gmail_app/widgets/gmail_message_list.dart';

class GmailPage extends StatefulWidget {
  const GmailPage({super.key});

  @override
  State<GmailPage> createState() => _GmailPageState();
}

class _GmailPageState extends State<GmailPage> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 12.0),
                        hintText: 'Search in emails',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Align(
                            alignment: Alignment.center,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 215, 228, 238),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 450,
                                width: 350,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Quick settings",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.close))
                                        ],
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.white,
                                              ),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue),
                                            ),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return const SeeAllSettingsPage();
                                                },
                                              ));
                                            },
                                            child:
                                                const Text("See all Settings")),
                                      ),
                                      const Divider(),
                                      const Text("Apps in Gmail"),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Chat and Meet"),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Customise")),
                                      const Divider(),
                                      Row(
                                        children: [
                                          createRadio("option1", _selected,
                                              (value) {
                                            setState(() {
                                              _selected = value;
                                            });
                                          }),
                                          Text(
                                            "Default",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selected == "option1"
                                                  ? Colors.blue
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          createRadio("option2", _selected,
                                              (value) {
                                            setState(() {
                                              _selected = value;
                                            });
                                          }),
                                          Text(
                                            "Comfortable",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selected == "option2"
                                                  ? Colors.blue
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          createRadio("option2", _selected,
                                              (value) {
                                            setState(() {
                                              _selected = value;
                                            });
                                          }),
                                          Text(
                                            "Comfortable",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: _selected == "option2"
                                                  ? Colors.blue
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) => const GmailMessageList()),
            ),
          ],
        ),
      ),
    );
  }
}
