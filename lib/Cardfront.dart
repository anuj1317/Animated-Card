import 'package:flutter/material.dart';

class Cardfront extends StatelessWidget {
 final String cardNumber;
 final String cardname;

  Cardfront({Key key, this.cardNumber,this.cardname}) : super(key: key)
  {
    _formattedCardNumber = this.cardNumber.padRight(16,'*');
    _formattedCardNumber = _formattedCardNumber.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)}");

    _formattedname = this.cardname.padRight(6,'*');

  }

  String _formattedCardNumber;
  String _formattedname;


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 250,

          child: Card(
            color: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 50,
                        child: Image.asset('assets/visa.png')),
                    ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    _formattedCardNumber,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black12,offset: Offset(2,1)
                        )]),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Card Holder',
                            style: TextStyle(
                                fontSize: 20),
                          ),
                          Text(_formattedname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Expiry'),
                          Text(
                            '11/25',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
