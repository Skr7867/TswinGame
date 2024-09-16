class DepositModel {
  dynamic cash;
  dynamic usdt_amount;
  dynamic type;
  dynamic status;
  dynamic orderId;
  dynamic createdAt;
  dynamic typeimage;

  DepositModel(
      {this.cash,
        this.usdt_amount,
      this.type,
      this.status,
      this.orderId,
      this.createdAt,
      this.typeimage});

  DepositModel.fromJson(Map<String, dynamic> json) {
    cash = json['cash'];
    usdt_amount = json['usdt_amount'];
    type = json['type'];
    status = json['status'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    typeimage = json['typeimage'];
  }
}
