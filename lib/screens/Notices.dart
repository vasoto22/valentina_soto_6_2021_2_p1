import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:valentina_soto_6_2021_2_p1/components/loader_component.dart';
import 'package:valentina_soto_6_2021_2_p1/helpers/api_helper.dart';
import 'package:valentina_soto_6_2021_2_p1/models/data_model.dart';
import 'package:valentina_soto_6_2021_2_p1/models/response.dart';
import 'package:valentina_soto_6_2021_2_p1/screens/Notices.dart';
import 'package:valentina_soto_6_2021_2_p1/screens/notice.dart';


class Notice extends StatefulWidget {
  final String category;

  Notice({required this.category});

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  String _search = '';
  bool _isFilter = false;
  List<data_model> _notice = [];
  bool _showloader = false;

  @override
  void initState() {
    super.initState();
    _getNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[300],
          title: Text(widget.category),
          actions: <Widget>[
            _isFilter
                ? IconButton(
                    onPressed: _removeFilter, icon: Icon(Icons.filter_none))
                : IconButton(
                    onPressed: _showFilter, icon: Icon(Icons.filter_alt)),
          ],
        ),
        body: Center(
          child: _showloader
              ? LoaderComponent(
                  text: 'Por favor espere...',
                )
              : _getContent(),
        ));
  }

  Future<Null> _getNotice() async {
    setState(() {
      _showloader = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showloader = false;
      });

      await showAlertDialog(
          context: context,
          title: 'Error',
          message: 'Verifica que estes conectado a internet.',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }

    Response response = await api_helper.getCategory(widget.category);

    setState(() {
      _showloader = false;
    });

    setState(() {
      _notice = response.result;
    });
  }

  _getContent() {
    return _notice.length == 0 ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          _isFilter
              ? 'No hay noticias con este criterio de búsqueda.'
              : 'No hay noticias registrados.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

    Widget _getListView() {
    return RefreshIndicator(
      onRefresh: _getNotice,
      child: ListView(
        children: _notice.map((e) {
          return Card(
            color: Colors.grey.shade100,
            child: InkWell(
              onTap: () =>  _goEdit(e),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            e.imageUrl,
                            width: 50,
                          ),
                        ),
                        Text(
                          e.title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _removeFilter() {
    setState(() {
      _isFilter = false;
    });
    _getNotice();
  }

  void _showFilter() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('Filtrar Noticias'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Escriba las primeras letras de la noticia'),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Criterio de busqueda...',
                    labelText: 'Buscar',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    _search = value;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(onPressed: () => _filter(), child: Text('Filtrar')),
            ],
          );
        });
  }

  void _filter() {
    if (_search.isEmpty) {
      return;
    }

    List<data_model> filteredlist = [];

    for (var notice in _notice) {
      if (notice.title
          .toString()
          .toLowerCase()
          .contains(_search.toString().toLowerCase())) {
        filteredlist.add(notice);
      }
    }

    setState(() {
      _notice = filteredlist;
      _isFilter = true;
    });

    Navigator.of(context).pop();
  }

  void _goEdit(data_model model) async {
    String? result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => notice(
                  category: widget.category,
                  notices: model,
                )));

    if (result == 'yes') {
      _getNotice();
    }
  }
}