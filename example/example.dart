import 'package:flutter/material.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(Example());

Widget _getCardWithIcon(String name) {

  // Jdenticon only has 1 function you will need: toSvg(). This function requires a message (as a String).
  // The output is a SVG string which needs to be passed to the widget SvgPicture so that it can be rendered.
  // You can set the sizing, scaling, padding and margins when the SVG is actually rendered with SvgPicture, as seen below.
  final String rawSvg = Jdenticon.toSvg(name);

  return Card(
    child: Column(    
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.string(rawSvg, fit: BoxFit.fill, height: 32, width: 32,),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.string(rawSvg, fit: BoxFit.fill, height: 32, width: 32,),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.string(rawSvg, fit: BoxFit.fill, height: 32, width: 32,),
            ),
          ],
        ),
        SizedBox(height: 12.0,),
        SvgPicture.string(rawSvg, fit: BoxFit.contain, height: 64, width: 64,),
        SizedBox(height: 12.0,),
        SvgPicture.string(rawSvg, fit: BoxFit.scaleDown, height: 128, width: 128,),
        SizedBox(height: 12.0,),
        SvgPicture.string(rawSvg, fit: BoxFit.fitWidth, width: 256,),
        Text(name, textScaleFactor: 1.5, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, letterSpacing: 1.6),),
    ],
  ),);
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jdenticon Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jdenticon Example'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            // Give a string like a name, message or id to get the Jdenticon; please note that Jdenticon is case-sensitive
            _getCardWithIcon('Naomi'),
            _getCardWithIcon('Ridge'),
            _getCardWithIcon('Callie'),
          ],),
        ),
      ),
    );
  }
}