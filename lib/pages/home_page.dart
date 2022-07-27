import 'package:flutter/material.dart';
import 'package:flutter_aula_06bank/pages/formulario_transferencia_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transferencia> lista = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Transferências")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, indice) {
          Transferencia transf = lista[indice];
          return CardTransferencia(transferencia: transf);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future futuro =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          futuro.then((value) {
            setState(() {
              lista.add(value);
            });
          });
        },
      ),
    );
  }
}

class CardTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const CardTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        child: ListTile(
          title: Text("Conta: ${transferencia.conta}"),
          subtitle: Text("Valor: R\$ ${transferencia.valor}"),
          leading: const Icon(Icons.monetization_on),
        ),
      ),
    );
  }
}

class Transferencia {
  final int conta;
  final double valor;

  Transferencia(this.conta, this.valor);

  @override
  String toString() {
    return "Conta: $conta e valoar: $valor";
  }
}
