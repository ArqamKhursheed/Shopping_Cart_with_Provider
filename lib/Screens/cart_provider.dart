import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db_helper.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get Counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt("cart_item") ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  getCounter() {
    _getPrefItems();
    return _counter;
  }

  addtotalprice(double productprice) {
    _totalPrice = _totalPrice + productprice;

    _setPrefItems();
    notifyListeners();
  }

  removetotalprice(double productprice) {
    _totalPrice = _totalPrice - productprice;

    _setPrefItems();
    notifyListeners();
  }

  gettotalprice() {
    _getPrefItems();
    return _totalPrice;
  }
}
