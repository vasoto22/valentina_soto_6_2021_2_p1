import 'package:flutter/material.dart';
import 'package:valentina_soto_6_2021_2_p1/models/data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class notice extends StatefulWidget {

  final String category;
  final data_model notices;
  
  notice({
    required this.category,
    required this.notices
  });

  @override
  _noticeState createState() => _noticeState();
}

class _noticeState extends State<notice> {
  List<data_model> _notice = [];
  bool _showloader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Noticias'),
        ),
        body: Center(child: _getContent()));
  }

  _getContent() {
    return _getListView();
  }

  Widget _getListView() {
    return Container(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.network(
                widget.notices.imageUrl,
                width: 80,
              ),
              ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Autor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Text(
                widget.notices.author,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Titulo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            widget.notices.title,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Contenido:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notices.content,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Fecha',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            children: [
              Text(
                widget.notices.date,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Hora',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notices.time,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Url',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notices.url,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Leer más...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            widget.notices.readMoreUrl,
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}