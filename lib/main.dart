import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> columnList = ['Item 1', 'Item 2', 'Item 3'];
  List<String> listViewList = ['Item A', 'Item B', 'Item C'];
  List<String> separatedList = ['Item X', 'Item Y', 'Item Z'];

  void deleteColumnItem(int index) {
    setState(() {
      columnList.removeAt(index);
    });
  }

  void deleteListViewItem(int index) {
    setState(() {
      listViewList.removeAt(index);
    });
  }

  void deleteSeparatedItem(int index) {
    setState(() {
      separatedList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView Demo'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // Кнопка для добавления элемента в список колонок
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      columnList.add('New Item');
                    });
                  },
                  child: Text('Add to Column List'),
                ),
                // Вывод списка колонок в виде прокручиваемого списка
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: columnList.asMap().entries.map((entry) {
                        return ListTile(
                          title: Text(entry.value),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteColumnItem(entry.key);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Кнопка для добавления элемента в список ListView
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      listViewList.add('New Item');
                    });
                  },
                  child: Text('Add to ListView List'),
                ),
                // Вывод списка ListView в виде прокручиваемого списка
                Expanded(
                  child: ListView.builder(
                    itemCount: listViewList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listViewList[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteListViewItem(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Кнопка для добавления элемента в список ListView с разделителями
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      separatedList.add('New Item');
                    });
                  },
                  child: Text('Add to Separated List'),
                ),
                // Вывод списка ListView с разделителями в виде прокручиваемого списка
                Expanded(
                  child: ListView.separated(
                    itemCount: separatedList.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(separatedList[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteSeparatedItem(index);
                            },
                          ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}