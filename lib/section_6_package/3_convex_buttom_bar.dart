import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConvexButtonBarPage extends StatefulWidget {
  @override
  State<ConvexButtonBarPage> createState() => _ConvexButtonBarPageState();
}

class _ConvexButtonBarPageState extends State<ConvexButtonBarPage> {
  //todo obj Faker
  var faker = Faker();

  // todo parsing dari DateTime ke String
  String tanggal = DateTime.now().toIso8601String();

  // todo index slide screen page position
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // todo List Page widget slide screen
    List<Widget> widgets = [
      // Screen Page 0
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                  'https://picsum.photos/id/${500 + index}/200/300'),
            ),
            // title: Text('User Name ${index + 1}'),
            // todo menggunakan faker / dummy data random
            title: Text(faker.person.name()),
            // subtitle: Text(faker.internet.email()),

            // subtitle: Text('${DateTime.now()}'), // default flutter
            //todo menggunakan Packet Intl , String to DateTime
            // lihat di doc untuk format skeleton datetime nya
            subtitle: Text(
              DateFormat.yMMMMd().add_jms().format(DateTime.parse(tanggal)),
            ),
          );
        },
      ),
      const Center(
        child: Text("Discovery"),
      ),
      const Center(
        child: Text("All"),
      ),
      const Center(
        child: Text("Message"),
      ),
      const Center(
        child: Text("Profile"),
      ),
    ];

    print(faker.person.name()); // testing faker console
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convex Button Bar Package"),
        centerTitle: true,
      ),
      body: widgets[currentIndex],

      // todo Convex Button Bar Navigation
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.purple,
        // style: TabStyle.react, // style tab :D
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 2, // index aktif default
        // todo tab transisi slide page
        onTap: (int i) => setState(() {
          currentIndex = i;
        }),
      ),
    );
  }
}
