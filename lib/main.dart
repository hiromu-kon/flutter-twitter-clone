import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/next_page.dart';

import 'list_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<String> list = [];

    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 14, right: 14),
          child: ListView(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg',
                        )),
                    Icon(Icons.more_horiz),
                  ],
                ),
              ),
              Text('ひろむ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      height: 2)),
              Text('@myIDdesu',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              RichText(
                text: TextSpan(
                  style:
                      TextStyle(color: Colors.black, fontSize: 13, height: 2),
                  children: const <TextSpan>[
                    TextSpan(
                        text: '111',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'フォロー',
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    TextSpan(
                        text: ' 9,999,999',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, wordSpacing: 10)),
                    TextSpan(
                        text: 'フォロワー', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, right: 0),
                child: ListTile(
                  leading: Transform.translate(
                    offset: Offset(-16, 0),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  title: Transform.translate(
                    offset: Offset(-16, 0),
                    child: Text(
                      'プロフィール',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Icon(Icons.article_outlined,
                      color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'リスト',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Icon(Icons.article_outlined,
                      color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'トピック',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                    offset: Offset(-16, 0),
                    child: Icon(Icons.bookmark_border,
                        color: Colors.black, size: 28)),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'ブックマーク',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Icon(Icons.settings, color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    '設定とプライバシー',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                onTap: () {
                  setState(() {
                    list.add("テスト");
                  });
                },
              ),
              ListTile(
                leading: Transform.translate(
                  offset: Offset(-16, 0),
                  child:
                      Icon(Icons.help_outline, color: Colors.black, size: 28),
                ),
                title: Transform.translate(
                  offset: Offset(-16, 0),
                  child: Text(
                    'ヘルプセンター',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            onTap: () {
              _key.currentState!.openDrawer();
            }),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(
          'Twitter Clone',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: list.length == 0
          ? Container(
              padding: EdgeInsets.only(
                top: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('まだ何も投稿されていません'),
                ],
              ),
            )
          : ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.10wallpaper.com/wallpaper/1366x768/2005/Mountains_Rocks_Lake_2020_Landscape_High_Quality_Photo_1366x768.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ひろむ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '@myIDdesu',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text('0時間前',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                          size: 16,
                        )
                      ],
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index],
                            style: TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.repeat_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                  size: 18,
                                )
                              ],
                            ),
                          )
                        ]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListDetail(list[index]),
                        ),
                      );
                    });
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.black12,
                height: 3,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.article_outlined),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NextPage(list: list),
              fullscreenDialog: true,
            ),
          );

          print(list);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('ホーム')),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('ホーム'),
          ),
        ],
      ),
    );
  }
}
