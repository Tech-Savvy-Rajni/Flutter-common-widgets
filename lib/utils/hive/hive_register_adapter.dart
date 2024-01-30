
class HiveBoxConstants {
  static const String cartModel = "cartModel";
  static const String cartItemModel = "cartItemModel";
  static const String recentSearchModel = "recentSearchModel";
  static const String recentInventorySearchModel = "recentInventorySearchModel";
  static const String deliveryUnreadChatMsgModel = "deliveryUnreadChatMsgModel";
  static const String seatDetailBox="seatDetailBox";

}

class HiveMapKeys{
  static const seatDetailKey="seatDetailKey";
}

class HiveRegisterAdapter {
  static registerAdapters() {
    // Hive.registerAdapter(CartModelAdapter());
    // Hive.registerAdapter(CartItemModelAdapter());
    // Hive.registerAdapter(RecentSearchModelAdapter());
    // Hive.registerAdapter(RecentInventorySearchModelAdapter());
    // Hive.registerAdapter(HiveSeatDetailsAdapter());
    // Hive.registerAdapter(DeliveryUnreadChatMsgModel());
  }

  static openBox() async {
    // await Hive.openBox<CartModel>(HiveBoxConstants.cartModel);
    // await Hive.openBox(HiveBoxKeys.alcoholCheckBox);
    // await Hive.openBox<HiveSeatDetails>(HiveBoxConstants.seatDetailBox);
    // await Hive.openBox<CartItemModel>(HiveBoxConstants.cartItemModel);
    // await Hive.openBox<RecentSearchModel>(HiveBoxConstants.recentSearchModel);
    // await Hive.openBox<RecentInventorySearchModel>(
    //     HiveBoxConstants.recentInventorySearchModel);
    // await Hive.openBox<RecentInventorySearchModel>(
    //     HiveBoxConstants.deliveryUnreadChatMsgModel);
  }
}
