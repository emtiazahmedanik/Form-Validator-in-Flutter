import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.black,
            centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passwordcontroller = TextEditingController();
    final _formkey = GlobalKey<FormState>();
    bool obstext = true;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          focusColor: Colors.black,
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email must be entered';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: obstext,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: InkWell(
                            child: Icon(Icons.remove_red_eye_rounded),
                            onTap: () {
                              obstext = false;
                            },
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Password must be entered at-least 6 char';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()));
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool obstext = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email must be entered';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      obscureText: obstext,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          suffixIcon: InkWell(
                            child: Icon(Icons.remove_red_eye_rounded),
                            onTap: () {
                              setState(() {
                                obstext = !obstext;
                              });
                            },
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Password must be entered at-least 6 char';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondPage()));
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
