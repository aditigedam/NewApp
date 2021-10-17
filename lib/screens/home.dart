import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:new_app/services/api_manager.dart';
import 'package:new_app/services/newindia.dart';
import 'package:new_app/services/newsmodel.dart';
import 'package:new_app/services/techapi.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  String s = ' ';
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<void>getData() async{
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
      Response _respons = await get(uri) ;
      print(_respons.body);
      Map map = jsonDecode(_respons.body);
      s =  map["title"];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Page();
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin{
     String s = 'get';
     @override
  @override
     Future<NewModel> _newsModel = Api_manager().getNews();
     Future<NewsIndia> _newsModelIndia = Api_manager().getNewsIndia();
     Future<NewsTech>  _newsModelTech = Api_manager().getTech() as Future<NewsTech>;
 late TabController tabController;
  List<Tab> tab = [
    Tab(child: Text('Home')),
    Tab(child: Text('India'),),
    Tab(child: Text('Technology'),)
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tab.length, vsync: this);
    _newsModel = Api_manager().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('News App')),
        bottom: TabBar(tabs: tab,
        controller: tabController,),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: FutureBuilder<NewModel>(
                future: _newsModel,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    print('fine');
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.articles.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8,10,8,10),
                            child: ListTile(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context)
                                    {
                                      return Scaffold(
                                          appBar: AppBar(
                                            backgroundColor: Colors.blueAccent,
                                            title: Text('Description'),
                                          ),
                                          body: ListView.builder(
                                              itemCount: 1,
                                              itemBuilder: (context,newindex){


                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('${snapshot.data!.articles[index].title}' ,
                                                    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ,),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image(image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(8,0,8,8),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('${snapshot.data!.articles[index].description}',
                                                      style:TextStyle(fontSize: 20)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text('${snapshot.data!.articles[index].content}',
                                                      style:TextStyle(fontSize: 20),),
                                                )
                                              ],
                                            );
                                          })
                                      );
                                    }));
                              },
                              // tileColor: Colors.pinkAccent,
                              //    title: Text(snapshot.data!.articles[index].title,overflow:TextOverflow.ellipsis,
                              //    maxLines: 3,),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${snapshot.data!.articles[index].title}',
                                      overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.red),),
                                    Text(snapshot.data!.articles[index].description,
                                      overflow: TextOverflow.ellipsis,maxLines: 4,)
                                  ],
                                ),
                                trailing: Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.redAccent
                                  ),
                                  // child: Image.network(
                                  //     snapshot.data!.articles[index].urlToImage)
                                )),
                          );
                        });
                  }
                  return Text('null');
                }
            ),
          ),
          Container(
            child: FutureBuilder<NewsIndia>(
                future: _newsModelIndia,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    print('fine');
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.articles.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8,10,8,10),
                            child: ListTile(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context)
                                      {
                                        return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor: Colors.blueAccent,
                                              title: Text('Description'),
                                            ),
                                            body: ListView.builder(
                                                itemCount: 1,
                                                itemBuilder: (context,newindex){

                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].title}' ,
                                                          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Image(image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(8,0,8,8),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].description}',
                                                            style:TextStyle(fontSize: 20)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].content}',
                                                          style:TextStyle(fontSize: 20),),
                                                      )
                                                    ],
                                                  );
                                                })
                                        );
                                      }));
                                },
                                // tileColor: Colors.pinkAccent,
                                //    title: Text(snapshot.data!.articles[index].title,overflow:TextOverflow.ellipsis,
                                //    maxLines: 3,),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${snapshot.data!.articles[index].title}',
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.red),
                                    ),
                                    Text(snapshot.data!.articles[index].description,
                                      overflow: TextOverflow.ellipsis,maxLines: 4,)
                                  ],
                                ),
                                trailing: Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    color: Colors.redAccent,
                                  )
                                )
                          ));
                        });
                  }
                  return Text('null');
                }
            ),
          ),
          Container(
            child: FutureBuilder<NewsTech>(
                future: _newsModelTech,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.articles.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8,10,8,10),
                            child: ListTile(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context)
                                      {
                                        return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor: Colors.blueAccent,
                                              title: Text('Description'),
                                            ),
                                            body: ListView.builder(
                                                itemCount: 1,
                                                itemBuilder: (context,newindex){


                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].title}' ,
                                                          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Image(image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(8,0,8,8),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].description}',
                                                            style:TextStyle(fontSize: 20)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text('${snapshot.data!.articles[index].content}',
                                                          style:TextStyle(fontSize: 20),),
                                                      )
                                                    ],
                                                  );
                                                })
                                        );
                                      }));
                                },
                                // tileColor: Colors.pinkAccent,
                                //    title: Text(snapshot.data!.articles[index].title,overflow:TextOverflow.ellipsis,
                                //    maxLines: 3,),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${snapshot.data!.articles[index].title}',
                                      overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(color: Colors.red),),
                                    Text(snapshot.data!.articles[index].description,
                                      overflow: TextOverflow.ellipsis,maxLines: 4,)
                                  ],
                                ),
                                trailing: Container(
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover, image: NetworkImage(snapshot.data!.articles[index].urlToImage)),
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      color: Colors.redAccent,
                                    backgroundBlendMode: BlendMode.softLight
                                  ),
                                  // child: Image.network(
                                  //     snapshot.data!.articles[index].urlToImage)
                                )),
                          );
                        });
                  }
                  return Text('null');
                }
            ),
          ),
        ],
      ),
    );
  }
}





