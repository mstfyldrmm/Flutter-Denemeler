import 'package:firebase/news_turkish/custom/sideBar.dart';
import 'package:firebase/news_turkish/model/category.dart';
import 'package:firebase/news_turkish/model/result.dart';
import 'package:firebase/news_turkish/screen/detailPage.dart';
import 'package:firebase/news_turkish/screen/navigate_widget.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase/news_turkish/view_model/result_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grock/grock.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class HomeScreenNews extends StatefulWidget {
  const HomeScreenNews({super.key});

  @override
  State<HomeScreenNews> createState() => _HomeScreenNewsState();
}

class _HomeScreenNewsState extends State<HomeScreenNews> with NavigatorManager{
  
  List<Results> searchList = [];
  TextEditingController _searchController = TextEditingController();
  bool isSearch = false;
  late FocusNode _focusNode;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();

  }

  void searchResult(String searchKeyword, ResultListViewModel  rmv) {
    for(var item in rmv.viewModel.results) {
      if(item!.title!.toLowerCase().trim().contains(_searchController.text.toLowerCase().trim()) || item!.description!.toLowerCase().trim().contains(_searchController.text.toLowerCase().trim())) {
        searchList.add(item);
      }
    }
    setState(() {
      searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final rmv = Provider.of<ResultListViewModel>(context);
    return Scaffold(
      drawer: isSearch ? null: SideBarNew(),
      appBar: AppBar(
        title: appbarTitle(rmv),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isSearch = !isSearch;
            });
          }, icon: searchIconWidget(), padding: EdgeInsets.only(right: 30),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            CategoryWidget(kategori: HomePageStrings.kategori, rmv: rmv,),
            Expanded(
                child: getWidgetByStatusNews(rmv, searchList))
          ],
        ),
      ),
    );
  }

  Widget appbarTitle(ResultListViewModel rmv) {
    if (isSearch) {
      return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CupertinoTextField(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(5),
            backgroundBlendMode: BlendMode.hardLight
            
          ),
          controller: _searchController,
          focusNode: _focusNode,
          textInputAction: TextInputAction.search,
          placeholder: 'Ara',
          
          style: Theme.of(context).textTheme.bodyLarge,
          onSubmitted: (value) {
            searchResult(value, rmv);
          },
        ),
      );
    } else {
      return AppBarWidget();
    }
  }

  Widget searchIconWidget() {
    if (isSearch) {
      return GrockContainer(
        padding: 10.onlyLeftP,
        child: const Icon(CupertinoIcons.clear, size: 24),
        onTap: () {
          setState(() {
            _focusNode.unfocus();
            isSearch = false;
            searchList.clear();
          });
        },
      );
    } else {
      return GrockContainer(
        padding: EdgeInsets.only(left: 40),
        child: const Icon(CupertinoIcons.search, size: 24),
        onTap: () {
          setState(() {
            _focusNode.requestFocus();
            isSearch = true;
          });
        },
      );
    }
  }


  Widget getWidgetByStatusNews(ResultListViewModel rvm, List<Results> icerik) {
    icerik = searchList.isNotEmpty
                    ? searchList
                    : rvm.viewModel.results;
    switch (rvm.status.index) {
      case 2:
        return MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: icerik.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => navigateToWidget(context, DetailPage(model: icerik[index])),
                        child: Card(
                          color:  ProjectColor.icerikRenkTwo,
                          margin: EdgeInsets.all(10),
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                Image.network(icerik[index].imageUrl ??
                                    HomePageStrings.noImage,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Text(HomePageStrings.errorMessage);
                                    },
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 10, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Text(
                                         icerik[index].sourceName ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      Text(icerik[index].pubDate!
                                              .substring(11, 13) + ' S' ??
                                          '')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 10, right: 30),
                                  child: Text(
                                   icerik[index].title ?? '',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });

      default:
        return Center(child: LottieBuilder.asset(HomePageStrings.lottiePath, height: 150,),);
    }
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        HomePageStrings.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(HomePageStrings.subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.kategori, required this.rmv,
  });

  final List<Category> kategori;
  final ResultListViewModel rmv;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kategori.length,
          itemBuilder: (context, index) {
            return Card(
              color: ProjectColor.icerikRenkTwo,
              margin: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () => rmv.getNews(kategori[index].key),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                  child: Text(
                    kategori[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HomePageStrings {
  static List<Category> kategori = [
    Category('top', 'Genel'),
    Category('business', 'İş'),
    Category('entertainment', 'Eğlence'),
    Category('health', 'Sağlık'),
    Category('science', 'Bilim'),
    Category('sports', 'Spor'),
    Category('world', 'Dünya'),
    Category('environment', 'Çevre'),
    Category('politics', 'Politika'),
    Category('technology', 'Teknoloji'),
  ];
  static String title = 'Gündemdeyiz';
  static String subTitle = 'Türkiyeden Anlık Haberler';
  static String lottiePath = 'assets/Lottie/loading.json';
  static String noImage = 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
  static String errorMessage = 'Resim Yüklenemedi';
  //static String
}