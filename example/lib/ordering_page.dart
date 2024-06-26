import 'package:flutter/material.dart';
import 'package:flutter_qa/qa_widgets/qa_draglist.dart';

/// For demo purposes only. Save production data state using appropriate engines like redux.

final List<OrderableItem> items = <OrderableItem>[
  OrderableItem()
    ..title = 'Item 1'
    ..color = Colors.blue[300]!,
  OrderableItem()
    ..title = 'Item 2'
    ..color = Colors.blue[400]!,
  OrderableItem()
    ..title = 'Item 3'
    ..color = Colors.blue[500]!,
  OrderableItem()
    ..title = 'Item 4'
    ..color = Colors.blue[600]!,
  OrderableItem()
    ..title = 'Item 5'
    ..color = Colors.blue[700]!,
  OrderableItem()
    ..title = 'Item 6'
    ..color = Colors.blue[800]!
];

class OrderingPage extends StatefulWidget {
  OrderingPage({Key? key}) : super(key: key);

  @override
  State<OrderingPage> createState() {
    return OrderingPageState();
  }
}

class OrderingPageState extends State<OrderingPage> {

  int n = 0;
  late Iterable<int> order;

  @override
  void initState() {
    order = items.map<int>((f) => n++);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Text('Lorem ipsum dolor sit amet.'),
          DragListWidget<OrderableItem>(
            builder: DragListWidgetBuilder<OrderableItem>(
              onOrder: (new_order) {
                setState(() {
                  order = new_order;
                });
              },
              ordered: order,
              items: items,
              build: (BuildContext context, OrderableItem item) =>
                  _builtItem(item),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builtItem(OrderableItem item) {
    return Container(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Card(
          color: item.color,
          child: ListTile(
            title: Text(
              item.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}

class OrderableItem {
  late String title;
  late Color color;
}
