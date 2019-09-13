import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home() ,
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  //Chamada dos controllers de texto
  TextEditingController weightController = TextEditingController(text: "80");
  TextEditingController heightController = TextEditingController(text: "170");

  String _infoText = "Informe seus dados!";

  //Função resetar informações
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados";
    });

  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if(imc < 10){
          _infoText = "Revise seus dados!!!";
      }
      else if (imc < 18.6){
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc < 24){
        _infoText = "Peso Normal (${imc.toStringAsPrecision(4)})";
      } else if (imc < 30){
        _infoText = "Acima do peso (${imc.toStringAsPrecision(4)})";
      } else if(imc > 30){
        _infoText = "Obesidade Grau I";
      }else {
         _infoText = "Revise seus dados!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Icon(Icons.person_outline, size: 120.0,color: Colors.green),
        TextField(keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Peso (kg)",
          labelStyle: TextStyle(color:Colors.green)
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
        controller: weightController,
        ),
        TextField(keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Altura (cm)",
          labelStyle: TextStyle(color:Colors.green)
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
       
        controller: heightController,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
          height: 80.0,
          
          child: RaisedButton(
          onPressed: _calculate,
          child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
          color: Colors.green,
          
        ),
        ),
        ),
        Text(_infoText, 
        textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:25.0),)
      ],)
      )
    );
  }
}