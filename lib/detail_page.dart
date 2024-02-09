import 'package:flutter/material.dart';
import 'package:flutter_news_app/articles.dart';
import 'package:flutter_news_app/webview_page.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final Articles article;

  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(article.urlToImage),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                  ),
                ),
                Text(article.author),
                Text(article.publishedAt),
                const Divider(
                  color: Colors.grey,
                ),
                Text(article.content, style: TextStyle(fontSize: 17),),
                Center(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, WebViewPage.routeName, arguments: article.url);
                      },
                      icon: const Icon(Icons.open_in_browser),
                      label: const Text("Baca Selengkapnya")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}