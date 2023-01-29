import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:csv/csv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class bulkUpload extends StatefulWidget {
  const bulkUpload({Key? key}) : super(key: key);

  @override
  State<bulkUpload> createState() => _bulkUploadState();
}

class _bulkUploadState extends State<bulkUpload> {
  List<List<dynamic>> _data = [];
  String? filePath;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  // This function is triggered when the  button is pressed

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("Bulk Upload",
              style: TextStyle(color: Colors.white,
                fontSize: 20.0,)
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: const Text("Upload FIle"),
              onPressed:(){
                _pickFile();
              },
            ),
            //
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _data.length,
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemBuilder: (_, index) {
            //       return Card(
            //         margin: const EdgeInsets.all(3),
            //         color: index == 0 ? Colors.amber : Colors.white,
            //         child: ListTile(
            //           leading: Text(_data[index][0].toString(),textAlign: TextAlign.center,
            //             style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight:index == 0 ? FontWeight.bold :FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),
            //            title: Text(_data[index][3].toString(),textAlign: TextAlign.left,
            //             style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight: index == 0 ? FontWeight.bold :FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),
            //           trailing: Text(_data[index][4].toString(),textAlign: TextAlign.left,
            //             style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),
            //
            //         ),
            //
            //       );
            //
            //     },
            //
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  var evenOrOdd = index %2 == 0? true:false;
                  return
                    Scrollbar(
                      controller: _vertical,
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: Scrollbar(
                        controller: _horizontal,
                        thumbVisibility: true,
                        trackVisibility: true,
                        notificationPredicate: (notif) => notif.depth == 1,
                        child: SingleChildScrollView(
                          controller: _vertical,
                          child: SingleChildScrollView(
                            controller: _horizontal,
                            scrollDirection: Axis.horizontal,
                            child:/* "Card(
                              margin: const EdgeInsets.all(3),
                              color: index == 0 ? Colors.amber : Colors.white,
                              child: ListTile(
                                leading: Text(_data[index][0].toString(),textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight:index == 0 ? FontWeight.bold :FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),
                                title: Text(_data[index][3].toString(),textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight: index == 0 ? FontWeight.bold :FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),
                                trailing: Text(_data[index][4].toString(),textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: index == 0 ? 18 : 15, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,color: index == 0 ? Colors.red : Colors.black),),

                              ),

                            )"*/
                          DataTable(horizontalMargin: 1,border: TableBorder.all(width: 0.5),columnSpacing: 20,
                          // Datatable widget that have the property columns and rows.
                          columns: [
                          //Set the name of the column

                          DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),
                            DataColumn(label: Text(''),),

                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),
                            // DataColumn(label: Text(_data[0][0].toString()),),

                  ],
                  rows:[
                  // Set the values to the columns

                  for (int i=0;i< _data.length;i++)
                  DataRow(cells: [
                  DataCell(Text(_data[i][0].toString(),)),
                  DataCell(Text(_data[i][1].toString())),
                  DataCell(Text(_data[i][2].toString())),
                    DataCell(Text(_data[i][3].toString())),
                    DataCell(Text(_data[i][4].toString())),
                    DataCell(Text(_data[i][5].toString())),
                    DataCell(Text(_data[i][6].toString())),
                    DataCell(Text(_data[i][7].toString())),
                    DataCell(Text(_data[i][8].toString())),
                    DataCell(Text(_data[i][9].toString())),
                    DataCell(Text(_data[i][10].toString())),
                    DataCell(Text(_data[i][11].toString())),
                    DataCell(Text(_data[i][12].toString())),
                    DataCell(Text(_data[i][13].toString())),
                    DataCell(Text(_data[i][14].toString())),
                    DataCell(Text(_data[i][15].toString())),
                    DataCell(Text(_data[i][16].toString())),
                    DataCell(Text(_data[i][17].toString())),






                  ]

                  ),
                  ]
                  )





                      ),
                        ),
                      ),
                    );
                },
              ),
            ),














            Container(
              child:  ElevatedButton(
                onPressed: ()async{
                  // set loading to true here

                  for (var element in _data.skip(1))  // for skip first value bcs its contain name
                      {
                    // var mydata = {
                    //   "data": {
                    //     "certificateType": "ProofOfEducation",
                    //     "membershipNum": element[0],   if you want to iterate only name then use element[0]
                    //     "registrationNum": element[1],
                    //     "serialNum": element[2],
                    //     "bcName": element[3],
                    //     "bcExam": element[4],
                    //     "date":element[5]
                    //   },
                    //
                    // };
                    ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                      content: Text(element.toString()),
                    ));
                  }

                }, child: const Text("Iterate Data"),

              ),
            ),
          ],
        )
    );

  }

  void _pickFile() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;
    // we will log the name, size and path of the
    // first picked file (if multiple are selected)
    print(result.files.first.name);
    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    print(fields);

    setState(() {
      _data = fields;
    });
  }

}