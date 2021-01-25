import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app_1/favorite_list_page.dart';


Set<WordPair> _saved = Set<WordPair>();
class WordListPage extends StatelessWidget {
   const WordListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Appbar'),
        actions: [
          IconButton(icon: Icon(Icons.favorite), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FavoriteListPage(_saved.toList());
            }));
          }),
        ],
      ),
      body: Center(child: RandomWords()),

    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index >= words.length) words.addAll(generateWordPairs().take(10));
      return _getRow(words[index]);
    });
  }

  Widget _getRow(WordPair wordPair) {
    bool _isAlreadySaved = _saved.contains(wordPair);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {
            setState(() {
              if (_isAlreadySaved) {
                _saved.remove(wordPair);
              } else {
                _saved.add(wordPair);
              }
            });
          },
          title: Text(
            wordPair.asCamelCase,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: Icon(
            _isAlreadySaved ? Icons.favorite : Icons.favorite_border,
            color: _isAlreadySaved ? Colors.redAccent : Colors.grey,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 5,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
