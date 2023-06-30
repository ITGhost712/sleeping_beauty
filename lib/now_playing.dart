import 'package:flutter/material.dart';
import 'package:sleeping_beauty/home_screen.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
class NowPlaying extends StatefulWidget {
  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _currentTint = 50;
  double _currentProgress = 0;
  double _currentVolume = 50;
  bool _isPlaying = false;
 // double _value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          key: _scaffoldKey,
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
        leading: InkWell(
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
    },
    child: Icon(
    Icons.list,
    color: Colors.white,
    ),
    ),
    backgroundColor: Colors.brown.shade300,
    title: Text('Now-Playing Screen'),
    ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.brown.shade400,
                    radius: 30.0,
                    child: Text(
                      'Profile Pic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Notifications'),
                  onTap: () {
                    // Handle option 1 tap
                    print('Option 1 tapped');
                //    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: Text('About'),
                  onTap: () {
                    // Handle option 2 tap
                    print('Option 2 tapped');
                //    Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: Text('Contact Us'),
                  onTap: () {
                    // Handle option 3 tap
                    print('Option 3 tapped');
                 //   Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () {
                    // Handle option 3 tap
                   // print('Option 3 tapped');
                  //  Navigator.pop(context); // Close the drawer
                  },
                ),
                ListTile(
                  title: Text('Cancel Account'),
                  onTap: () {
                    // Handle option 3 tap
                   // print('Option 3 tapped');
                  //  Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
          ),
         body: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey.shade300,
                  ),
                  padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(30.0),
                      //width: 200.0,
                      child: CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.brown.shade300,
                        // Replace this with your album art widget
                        child: Text(
                          'Album Art',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tint Status: ${_currentTint.toInt()}%',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey.shade200,
                      ),
                      padding: EdgeInsets.all(0.0),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                // Handle restart track button click
                                print('Restart Track');
                              },
                              icon: Icon(Icons.replay),
                            ),
                            IconButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                // Handle pause/resume button click
                                setState(() {
                                  _isPlaying = !_isPlaying;
                                });
                              },
                              icon: _isPlaying
                                  ? Icon(Icons.pause_circle_filled)
                                  : Icon(Icons.play_circle_filled),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:15.0),
                              child: Container(
                                width: 80.0,
                                child: ProgressBar(
                                  progressBarColor: Colors.brown.shade300,
                                 // baseBarColor: Colors.brown.shade300,
                                  thumbColor: Colors.brown.shade300,
                                  barHeight: 3.0,
                                  progress: Duration(seconds: 2),
                                  //buffered: Duration(milliseconds: 2000),
                                  total: Duration(seconds: 60),
                                  onSeek: (duration) {
                                    print('User selected a new time: $duration');
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(
                              'Volume',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle volume button click
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Volume Slider'),
                                      content: StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Slider(
                                                value: _currentVolume,
                                                min: 0,
                                                max: 100,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _currentVolume = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.volume_up),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 16,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10,
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
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle home icon tap
                    print('Home Icon Tapped');
                    // Navigate to another screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Icon(
                    Icons.home,
                    size: 48,
                  ),
                ),
              ),
            ],
        ),
         ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
