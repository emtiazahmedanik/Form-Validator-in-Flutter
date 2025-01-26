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
                padding: EdgeInsets.only(left: 8,right: 8),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Email must be entered';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
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
                            onTap: (){
                                obstext=false;
                            },
                          ),
                          border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if (value==null||value.isEmpty||value.length<6) {
                          return 'Password must be entered at-least 6 char';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(

                          onPressed: (){
                            if (_formkey.currentState!.validate()) {

                            }  
                          },
                          child: Text('Submit',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),

                    )
                  ],
                ),
              )
          )
        ],
      )),
    );
  }
}
