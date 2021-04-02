class OperationModel {
  String name;
  String selectedIcon;
  String unselectedIcon;

  OperationModel({
    required this.name,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}

List<OperationModel> operations = _operationData
    .map((item) => OperationModel(
          name: item['name'],
          selectedIcon: item['selectedIcon'],
          unselectedIcon: item['unselectedIcon'],
        ))
    .toList();

final _operationData = <Map<String, dynamic>>[
  {
    'name': "Money Transfer",
    'selectedIcon': "assets/svg/money_transfer_white.svg",
    'unselectedIcon': "assets/svg/money_transfer_blue.svg",
  },
  {
    'name': "Insights Tracking",
    'selectedIcon': "assets/svg/insights_tracking_white.svg",
    'unselectedIcon': "assets/svg/insights_tracking_blue.svg",
  },
  {
    'name': "Bank Withdraw",
    'selectedIcon': "assets/svg/bank_withdraw_white.svg",
    'unselectedIcon': "assets/svg/bank_withdraw_blue.svg",
  },
];
