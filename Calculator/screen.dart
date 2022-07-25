import 'package:flutter/material.dart';

class Dmc extends StatefulWidget {
  const Dmc({Key? key}) : super(key: key);

  @override
  State<Dmc> createState() => _DmcState();
}

class _DmcState extends State<Dmc> {
  late int arabic, eng, urdu, math, ps, isl;
  String obtMarks = "Obtained Marks";
  String percentage = "Percentage";
  String grade = "Grade";
  String? teacherName;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 40,
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.login_sharp)),
        ],
        title: const Text(
          'D M C',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  'D M C',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Arabic Marks',
                  ),
                  validator: (String? txt) {
                    if (txt != null && txt.isEmpty) {
                      return "Please Provide Arabic Marks";
                    }
                    arabic = int.parse(txt!);

                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'English Marks',
                  ),
                  validator: (String? txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Please Provide English Marks";
                    }
                    eng = int.parse(txt!);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Urdu Marks',
                  ),
                  validator: (String? txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Please Provide urdu Marks";
                    }
                    urdu = int.parse(txt!);

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Maths Marks',
                  ),
                  validator: (String? txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Please Provide Mathematics Marks";
                    }
                    math = int.parse(txt!);

                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Pak Study Marks',
                  ),
                  validator: (String? txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Please Provide Pak Study Marks";
                    }
                    ps = int.parse(txt!);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Islamiyat Marks',
                  ),
                  validator: (String? txt) {
                    if (txt == null || txt.isEmpty) {
                      return "Please Provide islamiyat Marks";
                    }
                    isl = int.parse(txt!);
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.reset();
                      },
                      child: const Text('C L E A R'),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          int obtainedMarks =
                              arabic + eng + urdu + math + ps + isl;
                          double percentage = obtainedMarks * 100 / 500;

                          setState(() {
                            obtMarks = " Obtained Marks : $obtainedMarks";
                            this.percentage = "Percentage : $percentage";

                            if (percentage >= 80)
                              grade = "A";
                            else if (percentage >= 70)
                              grade = "B";
                            else if (percentage >= 60)
                              grade = "B";
                            else if (percentage >= 40)
                              grade = "B";
                            else
                              grade = "Fail";
                          });
                        }
                      },
                      child: const Text('C A L C U L A T E'),
                    )),
                  ],
                ),
                Text(obtMarks),
                Text(percentage),
                Text(grade),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
