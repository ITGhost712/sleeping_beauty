import 'package:flutter/material.dart';
import 'package:sleeping_beauty/browse_audio.dart';
import 'package:sleeping_beauty/browse_scenes.dart';
class PairedDevices extends StatefulWidget {
  @override
  State<PairedDevices> createState() => _PairedDevicesState();
}

class _PairedDevicesState extends State<PairedDevices> {
  double _currentTint = 50;
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
    title: Text('Paired-Devices Screen'),
    ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset('images/logo1.png'),
                          height: 120.0,
                        ),
                        Text('Sleeping Beauty',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown.shade400,
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.grey.shade300,
                    ),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Text('Tint Level',
                          style: TextStyle(
                            color: Colors.brown.shade500,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.brightness_high,color: Colors.brown.shade500,),
                            Expanded(
                              child: SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 25,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 20,
                                  ),
                                ),
                                child: Slider(
                                  value: _currentTint,
                                  min: 0,
                                  max: 100,
                                  onChanged: (value) {
                                    setState(() {
                                      _currentTint = value;
                                    });
                                    //widget.onChanged(value);
                                  },
                                  activeColor: Colors.brown.shade300,
                                  inactiveColor: Colors.grey,
                                ),
                              ),
                            ),
                            Icon(Icons.brightness_low,color: Colors.brown.shade500,),
                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey.shade200,
                                ),
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.circle_outlined,
                                    size: 70.0,color: Colors.brown.shade500,),
                                    SizedBox(height: 10.0,),
                                    Text('Light'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15.0,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey.shade200,
                                ),
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.circle,
                                      size: 70.0,color: Colors.brown.shade500,),
                                    SizedBox(height: 10.0,),
                                    Text('Dark'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BrowseAudio()));
                          },
                            textColor: Colors.brown.shade600,
                            color: Colors.grey.shade300,
                          elevation: 5.0,
                          child: Text('Browse Audio'),),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scenes()));
                          },
                            textColor: Colors.brown.shade600,
                            color: Colors.grey.shade300,
                            elevation: 5.0,
                            child: Text('Browse Scenes'),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(onPressed: (){},
                            textColor: Colors.brown.shade600,
                            color: Colors.grey.shade300,
                            elevation: 5.0,
                            child: Text('Edit'),),
                        ),
                      ),
                      SizedBox(width: 15.0,),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(onPressed: (){},
                            textColor: Colors.brown.shade600,
                            color: Colors.grey.shade300,
                            elevation: 5.0,
                            child: Text('Delete'),),
                        ),
                      ),
                    ],
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
