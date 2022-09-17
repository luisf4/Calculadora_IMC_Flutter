// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  // fuckin controler that dont make n sense 
  final _textController = TextEditingController();  
  final _textController2 = TextEditingController();  
  // na vdd isso faz um pouco de sentido sim :^}


  double peso = 0;
  double altura = 0;
  double imc = 0;

  String imageName= 'images/image1.png';
  String imcTipo= ''; 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Calculadora de IMC'),),
      body: Padding(
        // padding: const EdgeInsets.all(20.0),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _textController,
                decoration: InputDecoration(
                  suffixText: 'kg ex:64',
                  hintText: "Digite a seu peso",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed:() {_textController.clear();} ,icon: Icon(Icons.clear)),
                  ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
               child: TextField(
                keyboardType: TextInputType.number,
                controller: _textController2,
                decoration: InputDecoration(
                  suffixText: 'm\'s ex:1.75',
                  hintText: "Digite a sua altura",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed:() {_textController2.clear();} ,icon: Icon(Icons.clear)),
                  ),
            ),
             ),
            MaterialButton(
              onPressed: (){
                peso = double.parse(_textController.text);
                altura  = double.parse(_textController2.text)*2;
                imc = peso/altura;

                if (imc<=18.5){
                  setState(() {
                  imageName = 'images/image1.png';
                  imcTipo = 'Magro';
                  });
                }
                else if (imc>18.5 && imc<24.99) {
                  setState(() {
                  imageName = 'images/image2.png';
                  imcTipo = 'Normal';
                  });
                }
                else if (imc>=25 && imc<29.99) {
                  setState(() {
                  imageName = 'images/image3.png';
                  imcTipo = 'Acima do peso';
                  });
                }
                else {
                  setState(() {
                  imageName = 'images/image4.png';
                  imcTipo = 'Obeso';
                  });
                }
                

              },
              color: Colors.blue,
              child: Text('Calcular'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('O Seu IMC é de:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(imc.toString()),
              ),
              Text(imcTipo),
              Image.asset(imageName)
          ],
        ),
      ),
    );
  }
}
