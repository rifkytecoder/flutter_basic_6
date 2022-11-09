import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownPage extends StatelessWidget {
  DropDownPage({super.key});

  // todo Manual List data
  List<Map<String, dynamic>> dataList = [
    {
      "id": 1,
      "country": "Brazil",
    },
    {
      "id": 2,
      "country": "Italia",
    },
    {
      "id": 3,
      "country": "Tunisia",
    },
    {
      "id": 4,
      "country": "Canada",
    },
    {
      "id": 5,
      "country": "Germany",
    },
    {
      "id": 6,
      "country": "France",
    },
    {
      "id": 7,
      "country": "Turkey",
    },
    {
      "id": 8,
      "country": "Indonesia",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop Down Search Package"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        // todo DropDown Search
        child: DropdownSearch<Map<String, dynamic>>(
          // mode popupnya
          popupProps: PopupProps.menu(
            // dalam popup nya
            itemBuilder: (context, item, isSelected) => ListTile(
              title: Text(
                item['country'].toString(),
              ),
            ),
            // tampilkan search box
            showSearchBox: true,

            // showSelectedItems: true,
            // disabledItemFn: (String s) => s.startsWith('I'),
          ),
          // items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
          items: dataList, // panggil dataList
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              // buat Outline border
              border: OutlineInputBorder(),
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: (value) => print(value?["id"]), // memasukkan nilai kemana
          selectedItem: const {
            "id": 4,
            "country": "Canada",
          }, // default item yg di select

          // tampilkan icon clear button dan fungsi clear
          clearButtonProps: const ClearButtonProps(
            icon: Icon(Icons.clear, size: 24),
            isVisible: true,
          ),

          // dropdown pop nya
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?['country'].toString() ?? "Belum Ada Data"),
        ),
      ),
    );
  }
}
