import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        buildCard(
          title: 'Saldo de contas',
          amount: 'R\$ 3.054,61',
          amountColor: Colors.black,
        ),
        buildCard(
          title: 'Gastos de hoje',
          amount: 'R\$ 0,00',
          amountColor: Colors.red,
        ),
        buildMonthlyOverviewCard(),
        buildPendingAlertsCard(),
        buildCard(
          title: 'Saldo seguro',
          amount: 'R\$ 1.966,83',
          amountColor: Colors.green,
        ),
      ],
    );
  }

  Widget buildCard({required String title, required String amount, required Color amountColor}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16.0,
                color: amountColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMonthlyOverviewCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Visão geral do mês',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            buildOverviewRow('Receitas', 'R\$ 1.500,00', Colors.green),
            buildOverviewRow('Despesas', 'R\$ 0,00', Colors.red),
            buildOverviewRow('Despesas no crédito', 'R\$ 354,67', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget buildPendingAlertsCard() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pendências e alertas',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            buildOverviewRow('Receitas pendentes', 'R\$ 1.150,00', Colors.blue),
            buildOverviewRow('Despesas pendentes', 'R\$ 552,61', Colors.red),
            buildOverviewRow('Faturas de cartão', 'R\$ 535,17', Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget buildOverviewRow(String title, String amount, Color amountColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
