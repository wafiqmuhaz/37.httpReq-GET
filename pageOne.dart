import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

class pageOne extends StatefulWidget {
  static const root = "/One";

  @override
  State<pageOne> createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {
  late String id;
  late String email;
  late String nama;

  @override
  void initState() {
    id = "";
    email = "";
    nama = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("GET - HTTP"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ID = $id",
            ),
            Text(
              "E-mail = $email",
            ),
            Text(
              "Nama Lengkap = $nama",
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                var mahuman = await myhttp.get(
                  Uri.parse(
                    "https://reqres.in/api/users/5",
                  ),
                );
                if (mahuman.statusCode == 200) {
                  // berhasil get data
                  print("BERHASIL GET DATA");

                  Map<String, dynamic> madata =
                      json.decode(mahuman.body) as Map<String, dynamic>;

                  setState(() {
                    id = madata["data"]["id"].toString();
                    email = madata["data"]["email"].toString();
                    nama =
                        "${madata["data"]["first_name"]} ${madata["data"]["last_name"]}";
                  });
                } else {
                  print("ERROR ${mahuman.statusCode}");
                  setState(() {
                    id = "ERROR ${mahuman.statusCode}";
                  });
                }
              },
              child: const Text("GET DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
