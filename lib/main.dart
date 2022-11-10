import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_6/models/citys.dart';
import 'package:flutter_basic_6/models/provinces.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DropDownApi(),
    );
  }
}

class DropDownApi extends StatelessWidget {
  // todo API-key
  final String apiKey =
      '6902a3f7c6d7de08f0c7b519fa01ca2230b96e20665d130d5c21453ec0790001';
  // variable Id
  String? idProv;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown Search x API"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // todo DropDown Search Provinces
          //<String>
          // menggunakan Models <Provinces>
          DropdownSearch<Provinces>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: false,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            // items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Menu Provinces",
                hintText: "country in menu mode",
              ),
            ),
            // onChanged: (value) => print(value?.toJson()), // testing
            // ambil id provinces
            onChanged: (value) => idProv = value?.id,
            // selectedItem: "Brazil",
            // todo Get List<String> Data Provinsi
            asyncItems: (text) async {
              final response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));
              // todo jika gagal kembalikan list [] kosong
              if (response.statusCode != 200) {
                return [];
              }
              // todo Parsing String ke List Map
              final List allProvince =
                  (jsonDecode(response.body) as Map<String, dynamic>)['value'];

              // todo tampung satuan value provinsi
              // <String>
              List<Provinces> allNameProvince = [];

              // todo looping nilai satu persatu dari List allProvince dan masukkan nilai ke allNameProvince
              for (var element in allProvince) {
                // allNameProvince.add(element['name']);
                allNameProvince.add(
                  Provinces(id: element['id'], name: element['name']),
                );
              }
              // todo mengembalikan value list data province
              return allNameProvince;
            },
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? 'Pilih Provinsi'),
          ),
          const SizedBox(
            height: 50,
          ),

          // todo City
          //<String>
          DropdownSearch<Citys>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              showSelectedItems: false,
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item.name),
              ),
            ),
            // items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Menu Provinces",
                hintText: "country in menu mode",
              ),
            ),
            // onChanged: (value) => print(value?.toJson()), // testing
            onChanged: (value) => idProv = value?.id, // ambil id provinces
            asyncItems: (text) async {
              final response = await http.get(Uri.parse(
                  "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));
              if (response.statusCode != 200) {
                return [];
              }

              final List allCity =
                  (jsonDecode(response.body) as Map<String, dynamic>)['value'];

              // <String>
              List<Citys> allNameCity = [];

              for (var element in allCity) {
                // allNameProvince.add(element['name']);
                allNameCity.add(
                  Citys(
                      id: element['id'],
                      idProvinsi: element['id_provinsi'],
                      name: element['name']),
                );
              }
              return allNameCity;
            },
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.name ?? 'Pilih Kota/Kabupaten'),
          ),
        ],
      ),
    );
  }
}
