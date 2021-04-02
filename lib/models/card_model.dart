class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardEleventTop;
  String cardEleventBottom;

  CardModel(
      {required this.user,
      required this.cardNumber,
      required this.cardExpired,
      required this.cardType,
      required this.cardBackground,
      required this.cardEleventTop,
      required this.cardEleventBottom});
}

List<CardModel> cards = _cardData
    .map((item) => CardModel(
        user: item['user'],
        cardNumber: item['cardNumber'],
        cardExpired: item['cardExpired'],
        cardType: item['cardType'],
        cardBackground: item['cardBackground'],
        cardEleventTop: item['cardEleventTop'],
        cardEleventBottom: item['cardEleventBottom']))
    .toList();

final _cardData = <Map<String, dynamic>>[
  {
    'user': "Amanda Alex",
    'cardNumber': "**** **** **** 2121",
    'cardExpired': "03-01-2023",
    'cardType': "assets/images/master_card_logo.png",
    'cardBackground': 0xFF1E1E99,
    'cardEleventTop': "assets/svg/ellipse_top_pink.svg",
    'cardEleventBottom': "assets/svg/ellipse_bottom_pink.svg",
  },
  {
    'user': "Peter Couch",
    'cardNumber': "**** **** **** 8287",
    'cardExpired': "02-04-2022",
    'cardType': "assets/images/master_card_logo.png",
    'cardBackground': 0xFFFF70A3,
    'cardEleventTop': "assets/svg/ellipse_top_blue.svg",
    'cardEleventBottom': "assets/svg/ellipse_bottom_blue.svg",
  }
];
