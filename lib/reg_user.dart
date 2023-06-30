import 'package:flutter/material.dart';
import 'package:sleeping_beauty/now_playing.dart';
import 'package:sleeping_beauty/paired_devices.dart';
class RegUser extends StatefulWidget {
  @override
  State<RegUser> createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {
  String msg='';
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
  final List<Device> pairedDevices = [
    Device(name: 'Device 1', icon: Icons.phone_android),
    Device(name: 'Device 2', icon: Icons.tablet),
    Device(name: 'Device 3', icon: Icons.watch),
  ];
  String? _selectedCategory;
  String? _selectedItem;

  final Map<String, List<String>> categoryItems = {
    'Favorites': ['Take a ‘x-branded’ PowerNap', 'Wind-Down for night', 'Evening Chill', 'Other Favorites'],
    'Sleeping Beauty Curations': ['Tinnitus-specific program', 'Circadian rhythm program', '…and others TBD'],
  };
  @override
  Widget build(BuildContext context) {
    String msg=greeting();
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
          title: Text('Registered User Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
          children: [
            Center(
              child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              Text('Good $msg User',
              style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
              ),
              ),
              ]
              ),
              ),
            SizedBox(
              height: 15.0,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade300,
                    ),
                    onPressed: () {
                      // Perform action when "Your paired Sleeping Beauty Devices" button is clicked
                      print('Your paired Sleeping Beauty Devices button clicked!');
                    },
                    child: Text('Your paired Sleeping Beauty Devices'),
                  ),
                  for (var device in pairedDevices)
                    Card(
                      elevation: 5.0,
                      color: Colors.grey.shade50,
                      child: ListTile(
                        leading: Icon(device.icon),
                        title: Text(device.name),
                        onTap: () {
                          // Perform action when device button is clicked
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PairedDevices()));
                          print('Device ${device.name} clicked!');
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10.0,
                  ),
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
            SizedBox(
              height: 10.0,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 7.0, top: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade300,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "I'd like to ...",
                      style: TextStyle(fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text('Select a category'),
                    value: _selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                        _selectedItem = null;
                      });
                    },
                    items: categoryItems.keys.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  if (_selectedCategory != null)
                    DropdownButton<String>(
                      hint: Text('Select an item'),
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                          // Navigate to NowPlaying screen when an item is selected
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NowPlaying()));
                        });
                      },
                      items: categoryItems[_selectedCategory!]
                          ?.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      })
                          .toList() ??
                          [],
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
class Device {
  final String name;
  final IconData icon;

  Device({required this.name, required this.icon});
}
