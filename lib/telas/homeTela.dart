import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectpn/widgets/melhoresDestinos.dart';
import 'package:projectpn/widgets/hotel.dart';

 class HomeTela extends StatefulWidget{
  @override
  _HomeTelaStatus createState() => _HomeTelaStatus();
 }

class _HomeTelaStatus  extends State<HomeTela>{
int _barraTab =0;
int _selecionarIndice =0;
  List<IconData> _icons = [
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.personWalking,
  FontAwesomeIcons.bicycle,
 ];
  Widget _buildIcon(int index) {
   //icones geram um index quando são clicados
   return GestureDetector(
    onTap: (){
     setState(() {
       _selecionarIndice = index;
     });
    },
    //container dos icons
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
       //mudança de cor ao selecionar
       color: _selecionarIndice == index
           ? Theme.of(context).colorScheme.secondary
           : const Color(0xFFE7EBEE),
       borderRadius: BorderRadius.circular(30.0),
     ),
       child: Icon(_icons[index],
        size: 25.0,
        color: _selecionarIndice == index
            ? Theme.of(context).primaryColor
            : const Color(0xFFB4C1C4),
    ),
   ),
   );
  }
  @override
 Widget build(BuildContext context){
   return Scaffold(
    body: SafeArea(
     child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      children: <Widget>[
      const Padding(
       padding: EdgeInsets.only(left: 20.0, right: 120.0),
       child: Text("O que você gostaria de encontra?",
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
       ),
      ),
       const SizedBox(height: 20.0),
       Row(
        //coloca espaçamento entre os icones
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //Map para pegar os indices da lista _icons e exibindo eles lado a lado
        children: _icons
            .asMap()
            .entries
            .map(
             (MapEntry map) => _buildIcon(map.key),
        )
        //convertendo de volta para o estado de lista
            .toList(),
       ),
        const SizedBox(height: 20),
       melhoresDestionos(),
       const SizedBox(height: 20,),
       HotelTela(),



      ],
    ),
     ),
    bottomNavigationBar: BottomNavigationBar(
     currentIndex:  _barraTab,
     onTap: (int valor){
       setState(() {
         _barraTab = valor;
       });
     },
     items: [
      const BottomNavigationBarItem(
       icon: Icon(
        Icons.search,
        size: 30,

      ),
       label: "",

      ),
      const BottomNavigationBarItem(
          icon: Icon(
           Icons.search,
           size: 30,
          ),
          label: ""
      ),
      const BottomNavigationBarItem(
       icon: CircleAvatar(
        radius: 15,
        backgroundImage: NetworkImage('https://i.imgur.com/AD3MbBi.jpeg'),
       ),
       label: "",
      ),
     ],
    ),
   );
  }
}
  