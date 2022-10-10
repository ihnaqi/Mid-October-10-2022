import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Mid extends StatefulWidget {
  const Mid({Key? key}) : super(key: key);

  @override
  State<Mid> createState() => _MidState();
}

class _MidState extends State<Mid> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Title',
                          hintText: 'Write the title of your task here',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 180,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Description',
                          hintText: 'Write the description of your task here',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: const Alignment(0, 0),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Date',
                              hintText: 'YYYY-MM-DD',
                            ),
                            controller: dateInput,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        child: ElevatedButton(
                          style: const ButtonStyle(),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateInput.text = formattedDate;
                              });
                            } else {}
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              right: 20,
            ),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                // color: Colors.green,
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
