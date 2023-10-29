import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OPERACIONES ARITMETICAS'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ArithmeticOperations(),
        ),
      ),
    );
  }
}

class ArithmeticOperations extends StatefulWidget {
  @override
  _ArithmeticOperationsState createState() => _ArithmeticOperationsState();
}

class _ArithmeticOperationsState extends State<ArithmeticOperations> {
  String _selectedOperation = 'Sumar';
  double num1 = 0;
  double num2 = 0;
  double resultado = 0;

  void _calculateResult() {
    switch (_selectedOperation) {
      case 'Sumar':
        resultado = num1 + num2;
        break;
      case 'Restar':
        resultado = num1 - num2;
        break;
      case 'Multiplicar':
        resultado = num1 * num2;
        break;
      case 'Dividir':
        if (num2 != 0) {
          resultado = num1 / num2;
        } else {
          resultado = 0; // Manejo de división por cero
        }
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinear elementos a la izquierda
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese Valor 1',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: (value) {
              setState(() {
                num1 = double.tryParse(value) ?? 0;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Ingrese Valor 2',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: (value) {
              setState(() {
                num2 = double.tryParse(value) ?? 0;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
              color: Color.fromARGB(255, 207, 204, 207),
            ),
            child: DropdownButton<String>(
              value: _selectedOperation,
              items: <String>['Sumar', 'Restar', 'Multiplicar', 'Dividir']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedOperation = value!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: _calculateResult,
            child: Text('Calcular'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Resultado: $resultado',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
