class CreateCartModel {
  CreateCartModel({
    this.channelId,
    this.customerId,
    this.lineItem,
    this.data_id,
  });

  int ? channelId;
  int ? customerId;
  List<dynamic>? lineItem ;
  String? data_id;

  factory CreateCartModel.fromJson(Map<String, dynamic> json) => CreateCartModel(
    channelId: json["channel_id"],
    customerId: json["customer_id"],
    lineItem: json["line_items"],
    data_id: json['data']['id'],
  );

  Map<String, dynamic> toJson() => {
    "channel_id": channelId,
    "customer_id": customerId,
    "line_items": lineItem,
    "id": data_id,
  };
}

class LineItems {
  LineItems({
    this.quantity,
    this.productId,
    this.optionSelection,
  });

  int ? quantity;
  int ? productId;
  List<dynamic>? optionSelection ;

  factory LineItems.fromJson(Map<String, dynamic> json) => LineItems(
    quantity: json["quantity"],
    productId: json["product_id"],
    optionSelection: json["option_selections"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "product_id": productId,
    "option_selections": optionSelection,
  };
}

class OptionSelection {
  OptionSelection({
    this.optionId,
    this.optionValue,
  });

  int ? optionId;
  int ? optionValue;

  factory OptionSelection.fromJson(Map<String, dynamic> json) => OptionSelection(
    optionId: json["option_id"],
    optionValue: json["option_value"],
  );

  Map<String, dynamic> toJson() => {
    "option_id": optionId,
    "option_value": optionValue,
  };
}