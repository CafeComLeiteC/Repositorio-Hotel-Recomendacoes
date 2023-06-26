
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectpn/modelos/atividade_modelo.dart';
import 'package:projectpn/modelos/modelo_destino.dart';

class TelaDestino extends StatefulWidget {
  final Destination destination;

  TelaDestino({required this.destination});

  @override
  _TelaDestinoState createState() => _TelaDestinoState();
}

class _TelaDestinoState extends State<TelaDestino> {

 Text _buildAvalicao(int rating){
    String estrelas = " ";
    for(int i=0; i< rating; i++){
      estrelas += '⭐ ';
    }
    return Text(estrelas);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.sortAmountDown),
                        iconSize: 25,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),

                    ],),
                  ],
                ),
            ),
                Positioned(
                  left: 20,
                  bottom: 20,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 5,),
                          Text(widget.destination.country,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 25,
                    ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top:10, bottom: 15),
                itemCount: widget.destination.activities.length,
                  itemBuilder: (BuildContext context, int index){
                  Activity activity = widget.destination.activities[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                          height: 170,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width:120,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    ),
                                    Text(
                                        '\$${activity.price}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),

                                    ),
                                  ],
                                ),
                                Text(
                                  activity.type,
                                  style: TextStyle( color: Colors.grey,
                                  ),
                                ),
                                _buildAvalicao(activity.rating),
                                SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).hintColor,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        activity.startTimes[0],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).hintColor,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        activity.startTimes[1],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 15,
                          bottom: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: 110,
                              image: AssetImage(
                                activity.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
              ),
            ),
          ],
    ),
      );


  }
}
