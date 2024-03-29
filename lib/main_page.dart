import 'package:flutter/material.dart';
import 'package:flutter_news_app/articles.dart';
import 'package:flutter_news_app/detail_page.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main_page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/articles.json'),
          builder: (context, snapshot) {
            final List<Articles> articles = parsedArticles(snapshot.data);

            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return _buildArticleItem(context, articles[index]);
                });
          }),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Articles articles) {
  return ListTile(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: articles);
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: SizedBox(
        width: 100,
        child: Image.network(
          articles.urlToImage,
          errorBuilder: (ctx, error, _) => const Center(
              child: Icon(
            Icons.error,
            color: Colors.red,
          )),
        ),
      ),
      title: Text(articles.title),
      subtitle: Text(articles.author));
}