import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thebulletin/models/article_model.dart';
import 'package:thebulletin/views/home.dart';

import '../helper/news.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({required this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;


  @override
  void initState() {
    // TODO: implement initState
    getCategoryNews();
    super.initState();
  }

    getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('The',
          style: TextStyle(
            color: Colors.black,
          ),),
          Text(
            'Bulletin',
            style: TextStyle(
              color: Color(0xFF2196F3),
            ),
          ),
          ]
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
      ),

      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) 
      : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Column(
              children: <Widget>[
                  //blogs
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:ClampingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index){
                        return BlogTile(
                          imageUrl: articles[index].urlToImage, 
                          title: articles[index].title, 
                          desc: articles[index].description,
                          url: articles[index].url,
                        );
                      }
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}