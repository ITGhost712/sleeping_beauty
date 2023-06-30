import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sleeping_beauty/non_reg_user.dart';
import 'package:sleeping_beauty/reg_user.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late Animation a;
  late AnimationController ac;
  void initState(){
    super.initState();
    ac=AnimationController(vsync: this,
        duration: Duration(seconds: 1));
    a=ColorTween(begin: Colors.brown.shade300,end: Colors.grey.shade50).animate(ac);
    ac.forward();
    ac.addListener(() {
      setState(() {});
      //print(a.value);
    });
  }
  void dispose(){
    ac.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Expanded(
            child: Scaffold(
              backgroundColor: a.value,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            child: Image.asset('images/logo1.png'),
                            height: 200.0,
                          ),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 45.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            color: Colors.brown.shade300,
                          ),
                          child: AnimatedTextKit(
                              animatedTexts: [TyperAnimatedText('Sleeping Beauty', speed: Duration(milliseconds: 200)),
                              ],
                              isRepeatingAnimation: false,
                              onTap: (){}
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.brown.shade300,
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NonReg()));
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Demo Screen for not logged-in / registered',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.brown.shade300,
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 5.0,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegUser()));
                          },
                          minWidth: 200.0,
                          height: 42.0,
                          child: Text(
                            'Demo Screen for logged-in / registered',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}