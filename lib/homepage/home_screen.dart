import 'package:flutter/material.dart';
import 'package:nba_flutter_app/globalconst/size.dart';
import 'package:nba_flutter_app/model/nba_data_model.dart';
import 'package:nba_flutter_app/provider/nba_service_provider.dart';
import 'package:nba_flutter_app/service/nba_api_service.dart';
import 'package:provider/provider.dart';

import '../provider/theme_notifier.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late final NbaApiService nbaApiService;
  TextEditingController textEditingController = TextEditingController();

  String deger = "2022";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NbaServiceProvider>(
      create: (context) => NbaServiceProvider(
        NbaApiService(),
        deger,
      ),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Image.asset(
                    "assets/logo/ball.png",
                    width: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "NBA",
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
            body: context.watch<NbaServiceProvider>().resources.isEmpty
                ? Center(child: CircularProgressIndicator())
                : GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: PageSize.width20),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                label: Text("Search by year..."),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        deger = textEditingController.text;
                                        context
                                            .read<NbaServiceProvider>()
                                            .fetch(deger);
                                        print(deger);
                                      });
                                    },
                                    icon: Icon(Icons.search))),
                            controller: textEditingController,
                          ),
                        ),
                        SizedBox(
                          height: PageSize.height20,
                        ),
                        Expanded(child: DataCardList()),
                      ],
                    ),
                  ));
      },
    );
  }
}

class DataCardList extends StatelessWidget {
  const DataCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PageSize.width20),
      child: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: PageSize.height20,
            crossAxisSpacing: PageSize.width20),
        itemCount: context.watch<NbaServiceProvider>().resources.length,
        itemBuilder: (context, index) {
          return Container(
           
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(PageSize.width20 * 2),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  
                Column(
                  
                  children: [
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(context
                              .watch<NbaServiceProvider>()
                              .resources[index]
                              .homeTeam!
                              .name!,
                              style: Theme.of(context).textTheme.titleLarge,),
                          SizedBox(
                            width: 5,
                          ),
                          Text("vs"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(context
                              .watch<NbaServiceProvider>()
                              .resources[index]
                              .visitorTeam!
                              .name!,style: Theme.of(context).textTheme.titleLarge,),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: PageSize.height20,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: PageSize.width15,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: Text(
                                context
                                            .watch<NbaServiceProvider>()
                                            .resources[index]
                                            .homeTeamScore! >
                                        context
                                            .watch<NbaServiceProvider>()
                                            .resources[index]
                                            .visitorTeamScore!
                                    ? "W"
                                    : "L",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: context
                                                .watch<NbaServiceProvider>()
                                                .resources[index]
                                                .homeTeamScore! >
                                            context
                                                .watch<NbaServiceProvider>()
                                                .resources[index]
                                                .visitorTeamScore!
                                        ? Colors.green
                                        : Colors.red),
                              )),
                          SizedBox(
                            width: PageSize.width10 / 2,
                          ),
                          Text(
                            context
                                .watch<NbaServiceProvider>()
                                .resources[index]
                                .homeTeamScore
                                .toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("vs"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            context
                                .watch<NbaServiceProvider>()
                                .resources[index]
                                .visitorTeamScore
                                .toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(width: PageSize.width10/2,),
                          CircleAvatar(
                              radius: PageSize.width15,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: Text(
                                context
                                            .watch<NbaServiceProvider>()
                                            .resources[index]
                                            .homeTeamScore! >
                                        context
                                            .watch<NbaServiceProvider>()
                                            .resources[index]
                                            .visitorTeamScore!
                                    ? "L"
                                    : "W",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: context
                                                .watch<NbaServiceProvider>()
                                                .resources[index]
                                                .homeTeamScore! >
                                            context
                                                .watch<NbaServiceProvider>()
                                                .resources[index]
                                                .visitorTeamScore!
                                        ? Colors.red
                                        : Colors.green),
                              )),
                        ],
                      ),
                    ),
                  
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: PageSize.width10),
                   decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(PageSize.width20 * 2),
                )),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Season: ${context.watch<NbaServiceProvider>().resources[index].season}"),
                      Text(
                        context
                            .watch<NbaServiceProvider>()
                            .resources[index]
                            .date!
                            .substring(0, 10)
                            .replaceAll("-", "/"),
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
