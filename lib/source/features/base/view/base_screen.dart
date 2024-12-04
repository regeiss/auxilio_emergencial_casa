import 'package:flutter/material.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({required Key key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  bool _isBack = true;
  bool _isCart = true;

  String appBarTitle();

  void onClickBackButton();

  void onClickCart();

  void isBackButton(bool isBack) {
    _isBack = isBack;
  }

  void isCartButton(bool isCart) {
    _isCart = isCart;
  }
}

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.pink.shade300])),
          ),
          title: Text(
            appBarTitle(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: _isBack
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    onClickBackButton();
                  },
                )
              : Container(),
          actions: [
            _isCart
                ? IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      onClickCart();
                    },
                  )
                : Container()
          ],
        ),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget body();
}

class HomeScreen extends BasePageScreen {
  HomeScreen({required super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageScreenState<HomeScreen> with BaseScreen {
  bool isButtonTapped = false;

  @override
  void initState() {
    isBackButton(false);
    super.initState();
  }

  // TO GIVE THE TITLE OF THE APP BAR
  @override
  String appBarTitle() {
    return "Home";
  }

  @override
  void isBackButton(bool isBack) {
    super.isBackButton(isBack);
  }

  // THIS IS BACK BUTTON CLICK HANDLER
  @override
  void onClickBackButton() {
    print("BACK BUTTON CLICKED FROM HOME");
    Navigator.of(context).pop();
  }

  // THIS IS RIGHT BAR BUTTON CLICK HANDLER
  @override
  void onClickCart() {
    print("CART BUTTON CLICKED");
    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartScreen()));
  }

  // THIS WILL RETURN THE BODY OF THE SCREEN
  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME SCREEN BODY"),
          // RaisedButton(
          //   onPressed: () {
          //     if(!isButtonTapped) {
          //       setState(() {
          //         isButtonTapped = true;
          //       });
          //     }
          //   },
          //   child: Text(isButtonTapped ? "BUTTON TAPPED" : "BUTTON NOT TAPPED"),
          // )
        ],
      ),
    );
  }
}
