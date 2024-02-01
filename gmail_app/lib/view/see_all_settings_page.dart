import 'package:flutter/material.dart';
import 'package:gmail_app/model/model.dart';
import 'package:gmail_app/widgets/diologie_box.dart';
import 'package:gmail_app/widgets/draggable_widget.dart';
import 'package:hive/hive.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';
import 'package:country_picker/country_picker.dart';

class SeeAllSettingsPage extends StatefulWidget {
  const SeeAllSettingsPage({Key? key}) : super(key: key);

  @override
  State<SeeAllSettingsPage> createState() => _SeeAllSettingsPageState();
}

class _SeeAllSettingsPageState extends State<SeeAllSettingsPage> {
  List<String> savedTextList = [];

  final _controller = TextEditingController();
  Country? _selectedCountry;

  String? _selected;

  Language selectedDialogLanguage = Languages.english;
  bool? isChecked = false;

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          const SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: const EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: const Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      selectedDialogLanguage = language;
                    }),
                itemBuilder: _buildDialogItem)),
      );

  @override
  Widget build(BuildContext context) {
    void createNewTask() async {
      await showDialog(
        context: context,
        builder: (context) {
          return DiologueBox(
            ontap: () async {
              String enteredText = _controller.text;
              var box = await Hive.openBox<TaskModel>('tasks');
              box.add(TaskModel(enteredText));
              Navigator.pop(context);
            },
            controller: _controller,
            onSave: () {
              Navigator.pop(context);
            },
            onCancel: () => Navigator.pop(context),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Language: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("Gmail display language: ",
                        style: TextStyle(fontSize: 17)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  height: 40,
                  width: 190,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedDialogLanguage.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      InkWell(
                        onTap: _openLanguagePickerDialog,
                        child: const Icon(
                          Icons.expand_more,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Change language settings for other Google products",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: isChecked == true ? Colors.blue : null,
                      value: isChecked,
                      onChanged: (bool? newvalue) {
                        setState(() {
                          isChecked = newvalue;
                        });
                      },
                    ),
                    const Column(
                      children: [
                        Text(
                          "Enable input tools -",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 47),
                  child: const Text(
                      "Use various text input tools to type in the language of your choice - Edit tools - Learn more"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    createRadio("option1", _selected, (value) {
                      setState(() {
                        _selected = value;
                      });
                    }),
                    Text(
                      "Right-to-left editing support off",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selected == "option1" ? Colors.blue : null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    createRadio("option2", _selected, (value) {
                      setState(() {
                        _selected = value;
                      });
                    }),
                    Text(
                      "Right-to-left editing support off",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selected == "option2" ? Colors.blue : null,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Row(
                  children: [
                    Text(
                      "PhoneNumber:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("default country code")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  height: 40,
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _selectedCountry?.displayName ?? '',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              flagSize: 25,
                              backgroundColor: Colors.white,
                              textStyle: const TextStyle(
                                  fontSize: 16, color: Colors.blueGrey),
                              bottomSheetHeight: 500,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                            onSelect: (Country country) => setState(() {
                              _selectedCountry = country;
                            }),
                          );
                        },
                        child: const Icon(
                          Icons.expand_more,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const Text(
                  "Default text style:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const Text(
                  "Stars:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                    "Drag the stars between the lists.  The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image."),
                Row(
                  children: [
                    const Text(
                      "Presets",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: const Text("1 star"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text("4 stars"),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: const Text("all stars"),
                      onPressed: () {},
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text("In use :"),
                    Draggable(
                      feedback: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      data: "In use star",
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                const DraggableWidget(),
                const Divider(),
                const Text(
                  "Signature: (appended at the end of all outgoing messages)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FutureBuilder<List<TaskModel>>(
                  future: getTasks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<TaskModel> tasks = snapshot.data ?? [];

                      if (tasks.isNotEmpty) {
                        return Container(
                          height: 200,
                          color: const Color.fromARGB(255, 233, 227, 212),
                          child: ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              TaskModel currentTask = tasks[index];
                              return ListTile(
                                title: Text(currentTask.signature),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        createNewTask();
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        deleteTask(currentTask);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('');
                      }
                    }
                  },
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      createNewTask();
                      _controller.clear();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Create new")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Radio<String> createRadio(
  String value,
  String? groupValue,
  void Function(String?) onChanged,
) {
  return Radio<String>(
    value: value,
    groupValue: groupValue,
    onChanged: onChanged,
    activeColor: Colors.black,
  );
}

Future<List<TaskModel>> getTasks() async {
  var box = await Hive.openBox<TaskModel>('tasks');

  List<TaskModel> tasks = box.values.toList();

  await box.close();
  return tasks;
}

Future<void> deleteTask(TaskModel task) async {
  var box = await Hive.openBox<TaskModel>('tasks');
  try {
    await box.delete(task.key);
  } finally {
    await box.close();
  }
}
