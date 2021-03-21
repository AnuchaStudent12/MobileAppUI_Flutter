import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:html' as html;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Container (
         child: Center(
           child: Column(
             children: [
               Image.asset('assets/starship.jpg',
               width: 600,
               height:400,
               fit: BoxFit.cover,
),
Container(
          height: 20,
        ),
      TitleSection(),
             Container(
          height: 20,
        ),
        ButtonSection(),
        Container(
          height: 15,
        ),
        TextSection(),    
        ],
           )
        ) ,
      ),
     ),
      builder: EasyLoading.init(),
     );
    }
}
class ButtonSection extends StatefulWidget {
  const ButtonSection({Key key}) : super(key: key);

  @override
  _ButtonSectionState createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {

  void _ShowCall() {
    setState(() {
      EasyLoading.showSuccess('CALL Success');
    });
  }
  void _ShowRoute() {
    setState(() {
      EasyLoading.showSuccess('God speed');
      html.window.open('https://youtu.be/gA6ppby3JC8', 'Starship');
    });
  }
  void _ShowShare() {
    setState(() {
      EasyLoading.showSuccess('Share Success');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.blue),
              onPressed: _ShowCall,
            ),
            Text('Call')
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.near_me, color: Colors.blue),
              onPressed: _ShowRoute,
            ),
            Text('Route')
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.share, color: Colors.blue),
              onPressed: _ShowShare,
            ),
            Text('Share')
          ],
        )
      ],
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  // ···
   @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _favoriteCount -= 1;
      _isFavorited = false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
}
class TextSection extends StatelessWidget {
  const TextSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Container(
      child: Container(
        child: Text('The SpaceX Starship system is a proposed fully reusable two-stage-to-orbit '
	    'super heavy-lift launch vehicle under development by SpaceX.' 
	    'The system is composed of a booster stage, named Super Heavy'
 	    'and a second stage,also referred to as "Starship".' 
	    'The second stage is being designed as a long-duration cargo,'
	    'and eventually, passenger-carrying spacecraft.The spacecraft'
            'will serve as both the second stage and the in-space long-duration orbital spaceship.'),
        constraints: BoxConstraints(
          maxHeight: 300.0,
          maxWidth: 400.0,
        ),
      ),
    )));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Starship'
          ,style: TextStyle(fontWeight: FontWeight.bold)),
          Text('SpaceX'
          ,style: TextStyle(color:Colors.black54),)
        ],
        ),
        FavoriteWidget(),
      ]
      );
  }
}



