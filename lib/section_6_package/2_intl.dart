import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntlPage extends StatelessWidget {
  //todo obj Faker
  var faker = Faker();

  // todo parsing dari DateTime ke String
  String tanggal = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
    print(faker.person.name()); // testing faker console
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intl Package"),
        centerTitle: true,
      ),
      body: ListView.builder(
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
    );
  }
}
