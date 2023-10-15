import 'package:news/models/sources_response.dart';

/// status : "ok"
/// totalResults : 5
/// articles : [{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Spain charges pop singer Shakira with tax evasion for a second time and demands more than $7 million","description":"Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, in Spain’s latest fiscal allegations against the Colombian singer","url":"https://abcnews.go.com/International/wireStory/spain-charges-pop-singer-shakira-tax-evasion-time-103486735","urlToImage":"https://i.abcnewsfe.com/a/43a2099e-0ba4-42aa-98ce-2ca0a73b67cf/wirestory_5d3698158bc565ac1dc6134c7d3baaa7_16x9.jpg?w=992","publishedAt":"2023-09-26T12:06:12Z","content":"BARCELONA, Spain -- Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, authorities said Tuesday, in Spains latest fiscal… [+1790 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Spain charges singer Shakira with tax evasion for second time, demands more than $7M","description":"Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, in Spain’s latest fiscal allegations against the Colombian singer","url":"https://abcnews.go.com/Entertainment/wireStory/spain-charges-pop-singer-shakira-tax-evasion-time-103486915","urlToImage":"https://i.abcnewsfe.com/a/43a2099e-0ba4-42aa-98ce-2ca0a73b67cf/wirestory_5d3698158bc565ac1dc6134c7d3baaa7_16x9.jpg?w=992","publishedAt":"2023-09-26T11:09:39Z","content":"BARCELONA, Spain -- Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, authorities said Tuesday, in Spains latest fiscal… [+1790 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"The Associated Press","title":"Spain charges pop singer Shakira with tax evasion for a second time and demands more than $7 million","description":"Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, in Spain’s latest fiscal allegations against the Colombian singer","url":"https://abcnews.go.com/Entertainment/wireStory/spain-charges-pop-singer-shakira-tax-evasion-time-103486736","urlToImage":"https://i.abcnewsfe.com/a/c97105fb-bd44-48fd-ab59-74ffcfb6916e/wirestory_5d3698158bc565ac1dc6134c7d3baaa7_16x9.jpg?w=992","publishedAt":"2023-09-26T11:02:33Z","content":"BARCELONA, Spain -- Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, authorities said Tuesday, in Spains latest fiscal… [+1790 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"SAM METZ Associated Press, MOSA'AB EL SHAMY Associated Press","title":"AP PHOTOS: Moroccan earthquake shattered thousands of lives","description":"With their arms around each other, three boys walked through the streets of their town at the foot of Morocco’s Atlas Mountains.\n\nIt could have been a scene like millions around the world that day. But in the Moroccan town of Amizmiz, the boys were walking th…","url":"https://abcnews.go.com/International/wireStory/ap-photos-moroccan-earthquake-shattered-thousands-lives-103256359","urlToImage":"https://i.abcnewsfe.com/a/e0d7683d-0f4d-49d9-a2c8-f05efe5577a1/wirestory_920c39947f895cdfc3448e5431df7562_16x9.jpg?w=992","publishedAt":"2023-09-17T04:22:15Z","content":"AMIZMIZ, Morocco -- With their arms around each other, three boys walked through the streets of their town at the foot of Moroccos Atlas Mountains.\r\nIt could have been a scene like millions around th… [+5610 chars]"},{"source":{"id":"abc-news","name":"ABC News"},"author":"ALMUDENA CALATRAVA Associated Press","title":"Paintings on pesos illustrate Argentina's currency and inflation woes","description":"The rapid depreciation of the Argentine currency and one of the world’s highest inflation rates has made it difficult for Argentines to make ends meet","url":"https://abcnews.go.com/Business/wireStory/paintings-pesos-illustrate-argentinas-currency-inflation-woes-103176361","urlToImage":"https://i.abcnewsfe.com/a/c95631ed-156b-4bac-a325-fe36e763df2e/wirestory_69a505d4f72c440a4bdd2e756e2d2d38_12x5.jpg?w=992","publishedAt":"2023-09-14T06:06:21Z","content":"BUENOS AIRES, Argentina -- A jaguar lies beside George Washington. The United States first president holds a rifle with one hand as he rests the other on the dead Argentine predator.\r\nThe backdrop is… [+4008 chars]"}]

class SearchNewsResponse {
  SearchNewsResponse({
    this.status,
    this.totalResults,
    this.code,
    this.message,
    this.articles,
  });

  SearchNewsResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<Articles>? articles;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"abc-news","name":"ABC News"}
/// author : "The Associated Press"
/// title : "Spain charges pop singer Shakira with tax evasion for a second time and demands more than $7 million"
/// description : "Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, in Spain’s latest fiscal allegations against the Colombian singer"
/// url : "https://abcnews.go.com/International/wireStory/spain-charges-pop-singer-shakira-tax-evasion-time-103486735"
/// urlToImage : "https://i.abcnewsfe.com/a/43a2099e-0ba4-42aa-98ce-2ca0a73b67cf/wirestory_5d3698158bc565ac1dc6134c7d3baaa7_16x9.jpg?w=992"
/// publishedAt : "2023-09-26T12:06:12Z"
/// content : "BARCELONA, Spain -- Spanish prosecutors have charged pop star Shakira with failing to pay 6.7 million euros ($7.1 million) in tax on her 2018 income, authorities said Tuesday, in Spains latest fiscal… [+1790 chars]"

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}

/// id : "abc-news"
/// name : "ABC News"
