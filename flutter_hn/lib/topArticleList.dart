import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_hn/story.dart';
import 'package:flutter_hn/webservice.dart';

import 'commentListPage.dart';

final materialThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(color: Colors.blue.shade600),
  primaryColor: Colors.orange,
  secondaryHeaderColor: Colors.orangeAccent,
  canvasColor: Colors.blue,
  backgroundColor: Colors.red,
  // textTheme: TextTheme().copyWith(body1: TextTheme().body1)
);
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.deepOrangeAccent,
    barBackgroundColor: Colors.deepOrangeAccent,
    scaffoldBackgroundColor: Colors.white);

class TopArticleList extends StatefulWidget {
  @override
  _TopArticleListState createState() => _TopArticleListState();
}

class _TopArticleListState extends State<TopArticleList> {

  List<Story> _stories = <Story>[];

  @override
  void initState() {
    super.initState();
    _populateTopStories();
  }

  void _populateTopStories() async {

    final responses = await Webservice().getTopStories();
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJSON(json);
    }).toList();

    setState(() {
      _stories = stories;
    });
  }

  void _navigateToShowCommentsPage(BuildContext context, int index) async {

    final story = this._stories[index];
    final responses = await Webservice().getCommentsByStory(story);
    final comments = responses.map((response) {
      final json = jsonDecode(response.body);
      return Comment.fromJSON(json);
    }).toList();

    debugPrint("$comments");

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CommentListPage(story: story, comments: comments)
    ));


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter HN"),
          backgroundColor: Colors.deepOrangeAccent,
          // material: (_, __)  => MaterialAppBarData(backgroundColor: Colors.deepOrangeAccent),
          // cupertino: (_, __) => CupertinoNavigationBarData(backgroundColor: Colors.deepOrangeAccent),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: ListView.builder(
            itemCount: _stories.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: ListTile(
                  onTap: () {
                    _navigateToShowCommentsPage(context, index);
                  },
                  title: Text(_stories[index].title, style: TextStyle(fontSize: 18)),
                  trailing: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(48))
                    ),
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("${_stories[index].commentIds.length}",style: TextStyle(color: Colors.black54)),
                    )
                  ),
                ),
              );
            },
          ),
        ),
    );

  }

}