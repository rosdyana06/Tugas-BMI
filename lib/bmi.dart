import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  int tahun = 0;
  int tgl = 0;

  String _jk = "";

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  var _nama = TextEditingController();
  var _bulan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[50],
      appBar: AppBar(
        //backgroundColor: Colors.blue[900],
        centerTitle: true,
        leading: Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        title: Text('MENGHITUNG BMI'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/dua');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              child: TextField(
                controller: _nama,
                decoration: InputDecoration(
                    hintText: 'Masukkan Nama',
                    labelText: 'Nama',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              child: TextField(
                onChanged: (txt) {
                  setState(() {
                    tgl = int.parse(txt);
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                    hintText: 'Masukkan Tanggal Lahir',
                    labelText: 'Tanggal Lahir',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              child: TextField(
                controller: _bulan,
                decoration: InputDecoration(
                    hintText: 'Masukkan Bulan',
                    labelText: 'Bulan Lahir',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15.0)),
            Container(
              child: TextField(
                onChanged: (txt) {
                  setState(() {
                    tahun = int.parse(txt);
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                    hintText: "Masukkan Tahun Lahir",
                    labelText: "Tahun Lahir",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            RadioListTile(
              value: "Laki-laki",
              groupValue: _jk,
              title: Text("Laki-laki"),
              onChanged: (String value) {
                _pilihJk(value);
              },
              subtitle: Text("Pilih ini jika Anda Laki-laki"),
            ),
            Padding(padding: EdgeInsets.only(top: 0.0)),
            RadioListTile(
              value: "Perempuan",
              groupValue: _jk,
              title: Text("Perempuan"),
              onChanged: (String value) {
                _pilihJk(value);
              },
              subtitle: Text("Pilih ini jika Anda Perempuan"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                // color: Colors.blue[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            tinggi = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            filled: true,
                            hintText: 'Tinggi'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            berat = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            filled: true,
                            hintText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResult(
                            namaL: _nama.text,
                            tgl: tgl,
                            bulan: _bulan.text,
                            tinggiB: tinggi,
                            beratB: berat,
                            tahunL: tahun,
                            jk: _jk),
                      ));
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.blueAccent,
                // textColor: Colors.white,
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
