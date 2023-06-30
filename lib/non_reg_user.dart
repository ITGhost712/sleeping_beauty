import 'package:flutter/material.dart';
class NonReg extends StatefulWidget {
  @override
  State<NonReg> createState() => _NonRegState();
}

class _NonRegState extends State<NonReg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.brown.shade300,
          title: Text('Non-Registered User Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Hi There!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.devices,
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text('You don’t have any paired devices',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.brown.shade300,
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        child: const Icon(Icons.add),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Add a Sleeping Beauty Device',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          //fontWeight: FontWeight.bold,
                          color: Colors.brown.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
