class UrlHelper {

  static Uri urlForStory(int storyId) {
    return Uri.parse("https://hacker-news.firebaseio.com/v0/item/${storyId}.json?print=pretty");
  }

  static Uri urlForTopStories() {
    return Uri.parse("https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
  }

  static Uri urlForCommentById(int commentId) {
    return Uri.parse("https://hacker-news.firebaseio.com/v0/item/${commentId}.json?print=pretty");
  }

}