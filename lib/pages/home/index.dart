import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: () => {
                      Navigator.of(context)
                          .pushNamed("home_detail_page", arguments: "我是父页面参数")
                    },
                icon: Icon(Icons.more))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text("flex基础单行布局"),
              ),
              FlexWidget(),
              SizedBox(height: 20.0),
              Center(
                child: Text("flex多行布局"),
              ),
              Padding(padding: EdgeInsets.all(1.0)),
              FlexWidget2(),
              SizedBox(height: 20.0),
              Center(
                child: Text("flex单行自动换行"),
              ),
              WrapWidget(),
              SizedBox(height: 20.0),
              Center(
                child: Text("Algin组件"),
              ),
              AlginWidget(),
              SizedBox(height: 20.0),
              Center(
                child: Text("ButtonBar组件"),
              ),
              ButtonBarWidget(),
              SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: Text('SnackBar'),
                      backgroundColor: Colors.green,
                      action: SnackBarAction(
                        textColor: Colors.white,
                        label: '撤销',
                        onPressed: () {},
                      ),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('底部提示SnackBar'),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text("装饰类Decoratedbox组件"),
              ),
              DecoratedBoxWidget(),
              SizedBox(height: 100.0),
              Center(
                child: Text("overflow溢出容器"),
              ),
              Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
                  padding: EdgeInsets.all(10.0),
                  child: OverflowBox(
                    // 溢出容器
                    alignment: Alignment.bottomRight, // 溢出方向
                    maxHeight: 200.0,
                    maxWidth: 200.0,
                    child: Container(
                      color: Colors.blue,
                      width: 300.0,
                      height: 500.0,
                    ),
                  )),
              TextButton(onPressed: () {}, child: Text('text button')),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home),
                label: Text('TextButton'),
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text('ElevatedButton'),
              ),
              Divider(color: Colors.red, height: 1.0),
              RawMaterialButton(onPressed: (){}, child: Text('RawMaterialButton'),)
            ],
          ),
        ));
  }
}

class DecoratedBoxWidget extends StatelessWidget {
  const DecoratedBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('lib/assets/images/logo.png'),
            ),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.red,
              width: 6.0,
            ),
            shape: BoxShape.rectangle,
          ),
          child:
              Text('定位演示', style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ),
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween, // 对其方式
      mainAxisSize: MainAxisSize.max, // child 大小
      children: [
        ElevatedButton(onPressed: () {}, child: Text('按钮1')),
        ElevatedButton(onPressed: () {}, child: Text('按钮2')),
        ElevatedButton(onPressed: () {}, child: Text('按钮3')),
        ElevatedButton(onPressed: () {}, child: Text('按钮4')),
      ],
    );
  }
}

class AlginWidget extends StatelessWidget {
  const AlginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.center,
        widthFactor: 2.0,
        heightFactor: 2.0,
        child: Container(
          color: Colors.green,
          width: 100.0,
          height: 50.0,
          child: Text(
            'algin',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FlexWidget extends StatelessWidget {
  const FlexWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Flex布局1"),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Flex布局2"),
            ),
          ),
        ),
      ],
    );
  }
}

class FlexWidget2 extends StatelessWidget {
  const FlexWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(direction: Axis.horizontal, children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              ))
        ]),
        Flex(direction: Axis.horizontal, children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [Text("文字"), Text("icon")],
                  ),
                ),
              ))
        ]),
      ],
    );
  }
}

// flex wrap box
class WrapWidget extends StatelessWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 5,
      children: flexWraps(),
    );
  }

  // 循环列表
  List<Widget> flexWraps() => List.generate(
      23,
      (index) => Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.orange, Colors.deepOrange],
            )),
            child: Text(
              '$index',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ));
}
