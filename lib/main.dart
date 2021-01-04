import 'dart:math';

import 'package:card_animated/Cardback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Cardfront.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Cardpages(),
  ));
}

class Cardpages extends StatefulWidget {
  @override
  _CardpagesState createState() => _CardpagesState();
}

class _CardpagesState extends State<Cardpages> with SingleTickerProviderStateMixin {
  double _rotationf = 0;

  String _cardNumber = '';
  String _cvvNumber = ' ';
  String _name = '';
  TextEditingController _cardNumberController,_cvvController,_nameControler;

  AnimationController _flipAnimationcontroller;
  Animation<double> _flipAnimation;
  FocusNode _cvvFocus;

  _CardpagesState(){
    _cardNumberController = TextEditingController();
    _cvvController = TextEditingController();
    _cvvFocus = FocusNode();
    _nameControler = TextEditingController();

    _cardNumberController.addListener(() {
      _cardNumber = _cardNumberController.text;
      setState(() {});
    });

    _cvvController.addListener(() {
      _cvvNumber = _cvvController.text;
      setState(() {});
    });

    _nameControler.addListener(() {
      _name = _nameControler.text;
      setState(() {});
    });

    _cvvFocus.addListener(() {
      _cvvFocus.hasFocus ?
          _flipAnimationcontroller.forward() : _flipAnimationcontroller.reverse();
    });



  }

  @override
  void initState() {
    super.initState();
    _flipAnimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350)
    );
    _flipAnimation =
        Tween<double>(begin: 0,end: 1).animate(_flipAnimationcontroller)
     ..addListener(() {
       setState(() {});
     });
    _flipAnimationcontroller.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children:<Widget> [
              Transform(
                  transform: Matrix4.identity()
                  ..setEntry(3,2,0.001)
                    ..rotateY(pi* _flipAnimation.value),
            origin: Offset(MediaQuery.of(context).size.width/2 , 0),
                  child: _flipAnimation.value <0.5?Cardfront(cardNumber: _cardNumber,cardname: _name):Cardback(cvvnumber:_cvvNumber)
              ),
              // Slider(
              //     value: _rotationf,
              //     onChanged: (double value){
              //       setState(() {
              //         _rotationf = value;
              //       });
              //     }),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/world.png')
                    )
                ),
                padding: EdgeInsets.all(2),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Card Number'
                      ),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      controller: _cardNumberController,
                      maxLength: 16,
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Name on card'
                      ),
                      controller: _nameControler,
                      keyboardType: TextInputType.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children:<Widget> [
                        // Expanded(flex: 2,child: TextField(
                        //   decoration: InputDecoration(
                        //       hintText: 'Expiry Date'
                        //   ),
                        // ),),
                        SizedBox(
                          width: 220,
                        ),
                        Expanded(flex: 1,child: TextField(
                          decoration: InputDecoration(
                              hintText: 'CVV'
                          ),
                          maxLength: 3,
                          controller: _cvvController,
                          focusNode: _cvvFocus,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),),
                      ],
                    )


                  ],
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}

