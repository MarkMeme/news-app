import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/modal/SourcesResponse.dart';

import 'modal/NewsResponse.dart';


class ApiManager {
 static String baseUser = 'newsapi.org';

  static Future<SourcesResponse> getSources(String categoryId)async{
    /// https://newsapi.org/v2/top-headlines/sources?apiKey=7233c0773f0b4b9db78e87e5dd28d681
    var url = Uri.https(baseUser,'/v2/top-headlines/sources',
    {
      'apiKey' : '7233c0773f0b4b9db78e87e5dd28d681',
      'category' : categoryId
    }
    );
    try{
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody) ;
      var sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse ;
    }catch(e){
      rethrow ;
    }
  }

 //https://newsapi.org/v2/everything?q=bitcoin&apiKey=7233c0773f0b4b9db78e87e5dd28d681

static  Future<NewsResponse> getNews(String sourceId) async{
    var url = Uri.https(baseUser,'/v2/everything',
    {
      'apiKey' : '7233c0773f0b4b9db78e87e5dd28d681' ,
      'sources' : sourceId
    }
    );
    try{
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody) ;
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse ;
    }catch(e){
      rethrow ;
    }
}

}