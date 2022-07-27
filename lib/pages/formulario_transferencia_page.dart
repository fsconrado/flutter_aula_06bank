import 'package:flutter/material.dart';


class FormularioTransferencia extends StatelessWidget {
  final  controlaConta = TextEditingController();
  final  controlaValor = TextEditingController();

   FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Transfêrencia")),
      body: Column(
      children: <Widget> [
        CaixaDeTexto("Número da Conta", "Digite aqui o número da conta", controlaConta),
        CaixaDeTexto("Valor da Transferência", "R\$ 00,00", controlaValor),
        ElevatedButton(onPressed: (){
          print(controlaConta.text);
          print(controlaValor.text);
        }, child: Text("Enviar"))
      ]
      ),
    );
  }
}

class CaixaDeTexto extends StatelessWidget {
  final String titulo;
  final String comentario;
  final TextEditingController controla;

  const CaixaDeTexto(this.titulo, this.comentario, this.controla, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controla,
        decoration: InputDecoration(
        labelText: titulo,
        hintText: comentario,
      ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }
}
