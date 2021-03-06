import 'package:flutter/material.dart';

import './price_tag.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(products[index]['price'].toString()),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            child: Text('Union Square, San Francisco'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.lightBlue[300],
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString()),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No products found, please add some'),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
