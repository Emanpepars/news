import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/news_response.dart';
import 'package:news/models/search_news_response.dart';
import '../../../models/sources_response.dart';
import '../../components/const.dart';

class ApiManager{

  static Future<SourcesResponse> getSources(String category) async {

    //هنا بختار اذا كانت http or https ع حسب المطلوب مني
    //authority عايز ال base url or domain
    Uri url = Uri.https(base,"/v2/top-headlines/sources",{"apiKey": apiKey,"category": category,},);
    // هنا هو عايز url بس مش هيفهمه زي بوست مان ف هعرفه فوق الاول
   // http.get(url);
    // هبقي عايزه الرد
    http.Response response = await http.get(url);
    var jsonResponse = jsonDecode(response.body) ;
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcesResponse;
  }
  static Future<NewsResponse> getNewsResponse(String sourceId)async{
    Uri url = Uri.https(base,"/v2/everything",{ "apiKey": apiKey, "sources": sourceId});
    http.Response  response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<SearchNewsResponse> getSearchNewsResponse(String sourceId, String value) async{
    Uri url = Uri.https(base,"/v2/everything",{ "apiKey": apiKey, "sources": sourceId , "q": value,});
    http.Response  response = await http.get(url);
    var json = jsonDecode(response.body);
    SearchNewsResponse searchNewsResponse = SearchNewsResponse.fromJson(json);
    return searchNewsResponse;
  }
}