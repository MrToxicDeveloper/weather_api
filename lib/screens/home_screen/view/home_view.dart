import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/screens/home_screen/model/home_model.dart';
import 'package:weather_api/screens/home_screen/provider/home_provider.dart';
import 'package:weather_api/utils/api_helper/api_helper.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeProvider? proTrue;
  HomeProvider? proFalse;

  TextEditingController txtWeather = TextEditingController(text: "surat");

  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).apiCaller(txtWeather.text);
  }

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<HomeProvider>(context, listen: false);
    proTrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Today Weather",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: txtWeather,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: () => proFalse!.apiCaller(txtWeather.text),icon: Icon(Icons.search_rounded)),
                  hintText: "city",
                  border: OutlineInputBorder(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  // color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${proTrue!.mainModel!.location!.name}, ${proTrue!.mainModel!.location!.region}",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  // color: Colors.green,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${proTrue!.mainModel!.current!.tempC}",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(width: 10,),
                          Text(
                              "${proTrue!.mainModel!.current!.condition!.text}"),
                        ],
                      ),
                      SizedBox(height: 50,),
                      Text("Humidity :- ${proTrue!.mainModel!.current!.humidity}",style: TextStyle(fontSize: 25),),

                      SizedBox(height: 10,),
                      Text("Feels like :- ${proTrue!.mainModel!.current!.feelslikeC}",style: TextStyle(fontSize: 25),),SizedBox(height: 10,),
                      Text("Wind speed :- ${proTrue!.mainModel!.current!.windKph} kph",style: TextStyle(fontSize: 25),),
                    ],
                  ),
                ),
              ),
              // Container(),
            ],
          ),
        ),
      ),
    );
  }
}
