import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetFunc;

  Result(this.resultScore, this.resetFunc);

  String get resultPhrase {
    String resultText = 'You\'re Awesome';
    if (resultScore <= 10) {
      resultText = 'You\'re Trash.';
    } else if (resultScore > 10 && resultScore <= 20) {
      resultText = 'Okayish...';
    } else {
      resultText = 'You\'re Awesome';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text(
              "Restart Quiz!",
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.blue,
            onPressed: resetFunc,
          ),
        ],
      ),
    );
  }
}
