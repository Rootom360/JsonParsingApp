import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jsonparsing/JsonParse/Json_parse.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> getData() async{
    var res = await http.get("https://jsonplaceholder.typicode.com/users");
    print(res.body);
  }
  Future<void> postData() async{
    var res = await http.post("https://jsonplaceholder.typicode.com/posts",
    headers: {"content-type" : "application/json"});
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'API-Integration',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                  onPressed: getData,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Get request",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: postData,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Post request",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => JsonParsing()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, maxHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "See requests",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
