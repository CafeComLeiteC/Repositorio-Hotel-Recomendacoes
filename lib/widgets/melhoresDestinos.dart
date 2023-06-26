import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectpn/modelos/modelo_destino.dart';
import 'package:projectpn/telas/TelaDestino.dart';


class melhoresDestionos extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Text(
    'Principais Destinos',
    style: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    ),
    ),
    GestureDetector(
      onTap: () => print('Ver todos'),
     child: Text(''
         'Ver todos',
    style: TextStyle(
    color: Theme.of(context).primaryColor,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0
    ),
     ),
    )
    ],
    ),
    ),
      Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index){
            Destination destination = destinations[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TelaDestino(
                    destination: destination,
                  )
                )
              ),
              child:Container(
                margin: EdgeInsets.all(10.0),
                width: 210,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${destination.activities.length} Atividades',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              destination.description,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0,2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: destination.imageUrl,

                             child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Image(
                                height: 180,
                                width: 180,
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                             ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              Text(
                                destination.city,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.locationArrow,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(destination.country,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ),
            );
          },
        ),
      )
    ],
    );
  }
}



