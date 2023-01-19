import 'package:e_commerce_app/screens/homepage.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatefulWidget {
  final String image;
  final double price;
  final String name;
  DetailScreen({required this.image,required this.price,required this.name});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count=1;
  //const DetailScreen({Key? key}) : super(key: key);
Widget _buildSizeProduct({required String name}){
  return  Container(
    height: 60,
    width: 60,
    color: Color(0xfff2f2f2),
    child: Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize:17,
        ),
      ),
    ),
  );
}

  Widget _buildColorProduct({required Color color}){
    return  Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  final TextStyle myStyle=TextStyle(
    fontSize: 18
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Page",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
              onPressed:() {
                Navigator.of(context).
                pushReplacement(MaterialPageRoute(
                    builder: (ctx)=>HomePage()
                ),
                );
              },
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 350,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/${widget.image}"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  style: myStyle
                                ),
                                Text(
                                  "\$ ${widget.price.toString()}",
                                  style: TextStyle(
                                    color: Color(0xff9b96d6),
                                      fontSize: 18,
                                ),
                                ),
                                Text(
                                  "Description",
                                  style: myStyle
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        child: Wrap(
                          children: <Widget>[
                            Text(
                              "Let elegance enter your loft with the MOLY table which will embellish your dining room with light walls. The round top of the 12mm thick tempered glass table will fill your room with elegance and softness. The crisscrossed legs, in chrome, of contemporary style will fully accommodate modern interiors. Invite your friends to share a good meal during which they will have plenty of time to admire your magnificent table and be inspired by it for their own dining room.",
                              style: TextStyle(
                                fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Dimension",
                        style: myStyle
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _buildSizeProduct(name: "D 100cm"),//Diametre
                            _buildSizeProduct(name: "E 12mm"), //Epaisseur
                            _buildSizeProduct(name: "H  76cm"), //Hauteur
                            _buildSizeProduct(name: "L 100cm"), //Largeur
                          ],
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Color",
                  style: myStyle
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 265,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildColorProduct(color: Colors.black26),
                      _buildColorProduct(color: Colors.black38),
                      _buildColorProduct(color: Colors.black45),
                      _buildColorProduct(color: Colors.black54),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                 Text(
                   "Quantity",
                   style: myStyle
                 ),
                      SizedBox(
                        height: 15,
                      ),
                   Container(
                     height: 40,
                     width: 130,
                     decoration: BoxDecoration(
                         color: Colors.black26,
                       borderRadius: BorderRadius.circular(20),
                     ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                         GestureDetector(
                             child: Icon(Icons.remove),
                           onTap: (){
                               setState(() {
                                 if(count >1){
                                   count--;
                                 }
                               });
                           },
                         ),
                        Text(
                          count.toString(),
                          style: TextStyle(
                            fontSize:18,
                          ),
                        ),
                        GestureDetector(
                          child: Icon(Icons.add),
                          onTap: (){
                            setState(() {
                              count++;
                            });
                          },
                        ),
                      ],
                    ),
                   ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            primary:Colors.green,
                          ),
                          onPressed: (){},
                          child: Text(
                            "Check Out",
                            style: myStyle,
                          ),
                        ),
                      )
               ],
              ),
             ),
            ],
           ),
         ],
       ),
      ),
    );
  }
}
