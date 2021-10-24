class data_model {
  String author='';
  String content='';
  String date ='';
  String imageUrl='';
  String readMoreUrl='';
  String time='';
  String title='';
  String url='';

  data_model({
    required this.author,
    required this.content,
    required this.date,
    required this.imageUrl,
    required this.readMoreUrl,
    required this.time,
    required this.title,
    required this.url,
  });

  data_model.fromJson(Map<String, dynamic> json){
    author = json['author'];
    content = json['content'];
    date  = json['date'];
    imageUrl = json['imageUrl'];
    readMoreUrl = json['readMoreUrl'];
    time = json['time'];
    title = json['title'];
    url = json['url'];
  }
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> body = new Map<String, dynamic>();
    body['author'] = this.author;
    body['content'] = this.content;
    body['date'] = this.date;
    body['imageUrl'] = this.imageUrl;
    body['readMoreUrl'] = this.readMoreUrl;
    body['time'] = this.time;
    body['title'] = this.title;
    body['url'] = this.url;
    return body;
  }*/
}