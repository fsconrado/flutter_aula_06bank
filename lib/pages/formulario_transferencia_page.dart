import 'package:flutter/material.dart';
import 'package:flutter_aula_06bank/pages/home_page.dart';


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
          if(controlaConta.text !=null && controlaValor.text !=null){
            var conta  = int.parse(controlaConta.text);
            var valor = double.parse(controlaValor.text);
            Transferencia transferencia = Transferencia(conta, valor);
            Navigator.pop(context, transferencia);
          }

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
          icon: Icon(Icons.monetization_on),
        labelText: titulo,
        hintText: comentario,
      ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }
}
