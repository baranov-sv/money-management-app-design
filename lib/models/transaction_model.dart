class TransactionModel {
  String photo;
  String name;
  String date;
  String amount;

  TransactionModel({
    required this.photo,
    required this.name,
    required this.date,
    required this.amount,
  });
}

List<TransactionModel> transactions = _transactionData
    .map((item) => TransactionModel(
          photo: item['photo'],
          name: item['name'],
          date: item['date'],
          amount: item['amount'],
        ))
    .toList();

final _transactionData = <Map<String, dynamic>>[
  {
    'photo': "assets/images/uber.png",
    'name': "Uber ride",
    'date': "1st Apr 2020",
    'amount': '-\$35.21',
  },
  {
    'photo': "assets/images/nike.png",
    'name': "Nike Outlet",
    'date': "30th Mar 2020",
    'amount': '-\$100.00',
  },
  {
    'photo': "assets/images/payment.png",
    'name': "Payment Recieve",
    'date': "15th Mar 2020",
    'amount': '+\$250.00',
  },
];
