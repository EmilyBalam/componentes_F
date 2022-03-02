import 'package:componentes_f/src/providers/menu_provider.dart';
import 'package:componentes_f/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    /* menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    });*/
    return FutureBuilder(
      future: menuProvider.cargarData(),
      //initialData: InitialData,
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );

    /*return ListView(
      children: _listaItems(),
    );*/
  }

  List<Widget> _listaItems(List<dynamic>? data) {
    final List<Widget> opciones = [];

    data?.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {},
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    });
    return opciones;
  }
}