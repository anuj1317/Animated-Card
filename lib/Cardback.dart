import 'dart:math';

import 'package:flutter/material.dart';
class Cardback extends StatelessWidget {
  final String cvvnumber;

  const Cardback({Key key, this.cvvnumber}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3,2,0.001)
        ..rotateY(pi* 1),
      origin: Offset(MediaQuery.of(context).size.width/2 , 0),
      child: Container(
        width: 500,
        height: 250,
        color:Colors.white ,
        child: Card(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          elevation: 8,
          margin: EdgeInsets.all(16),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                color: Colors.black87,
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          width: 200,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Text(cvvnumber,style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 18),),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 16,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 150,
                      height: 16,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 16,
                      width: 150,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
