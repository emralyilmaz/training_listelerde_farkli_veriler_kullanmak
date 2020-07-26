import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      home: FormWidget(),
      theme: ThemeData(primarySwatch: Colors.red),
    ));

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final veriler = List<ListVeriler>.generate(
      1000,
      (i) => i % 7 == 0
          ? BaslikVeri("Başlık $i")
          : MesajVeri("başlık $i", "mesaj içerik $i"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom ListView"),
      ),
      body: ListView.builder(
          itemCount: veriler.length,
          itemBuilder: (context, index) {
            final veri = veriler[index];
            if (veri is BaslikVeri) {
              return ListTile(
                title: Text(
                  veri.baslik,
                  style: TextStyle(color: Colors.red, fontSize: 50),
                ),
              );
            } else if (veri is MesajVeri) {
              return ListTile(
                title: Text(
                  veri.baslik,
                ),
                subtitle: Text(veri.icerik),
              );
            }
          }),
    );
  }
}

abstract class ListVeriler {}

class BaslikVeri implements ListVeriler {
  final String baslik;
  BaslikVeri(this.baslik);
}

class MesajVeri implements ListVeriler {
  final String baslik;
  final String icerik;
  MesajVeri(this.baslik, this.icerik);
}
