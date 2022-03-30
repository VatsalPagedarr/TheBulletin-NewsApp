import 'dart:convert';
// import 'package:flutter/cupertino.dart';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  
  Future<void> getNews() async{
    
    String url = "https://newsapi.org/v2/everything?q=latest&apiKey=YOUR_API_KEY";
  
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    int cnt = 0;
    try{
      
      if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        cnt++;
        // if(element["urlToImage"] !=null && element["description"]!=null){
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );
          news.add(articleModel);
        // }
      });

//       for (int i = 0 ; i<jsonData["articles"].length;i++ ){
//         cnt++;
// 	    ArticleModel articleModel = ArticleModel(
//             title: jsonData["articles"][i]["title"],
//             author: jsonData["articles"][i]["author"],
//             description: jsonData["articles"][i]["description"],
//             url: jsonData["articles"][i]["url"],
//             urlToImage: jsonData["articles"][i]["urlToImage"],
//             content: jsonData["articles"][i]["content"]
//           );
//           news.add(articleModel);
// }
    }
    }
    catch(e){
      print(e);
    }
    // int b = news.length;
    // print(b);
    // print(jsonData["articles"][0]["title"]);
    print(cnt);
  }

}

class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    String url = "https://newsapi.org/v2/everything?q=$category&apiKey=YOUR_API_KEY";
  
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    // int cnt = 0;
    try{
      
      if(jsonData['status']=="ok"){
        //......................
        //foreach loop
        //......................
      // jsonData["articles"].forEach((element){
      //   cnt++;
      //   if(element["urlToImage"] !=null && element["description"]!=null){
      //     ArticleModel articleModel = ArticleModel(
      //       title: element["title"],
      //       author: element["author"],
      //       description: element["description"],
      //       url: element["url"],
      //       urlToImage: element["urlToImage"],
      //       content: element["content"]
      //     );
      //     news.add(articleModel);
      //   }
      // });

      for (int i = 0 ; i<jsonData["articles"].length;i++ ){
        // cnt++;
	    ArticleModel articleModel = ArticleModel(
            title: jsonData["articles"][i]["title"],
            author: jsonData["articles"][i]["author"],
            description: jsonData["articles"][i]["description"],
            url: jsonData["articles"][i]["url"],
            urlToImage: jsonData["articles"][i]["urlToImage"],
            content: jsonData["articles"][i]["content"]
          );
          news.add(articleModel);
}
    }
    }
    catch(e){
      print(e);
    }
    // int b = news.length;
    // print(b);
    // print(jsonData["articles"].length);
    // print(cnt);
  }

}
