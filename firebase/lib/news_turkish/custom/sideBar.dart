import 'package:firebase/news_turkish/model/doviz.dart';
import 'package:firebase/news_turkish/service/services.dart';
import 'package:firebase/news_turkish/theme/color.dart';
import 'package:firebase/news_turkish/view_model/result_list_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarNew extends StatefulWidget {
  const SideBarNew({super.key});

  @override
  State<SideBarNew> createState() => _SideBarNewState();
}

class _SideBarNewState extends State<SideBarNew> {
  DovizServices serv = DovizServices();
  List<Doviz> dovisBilgisi = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }

  Future<void> getDatas() async {
    dovisBilgisi = await serv.getMoneys();
    setState(() {
      dovisBilgisi;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: EdgeInsets.all(10),
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.elliptical(10, 10)),
        gradient: LinearGradient(
          colors: [
            ProjectColor.buttonColor,
            ProjectColor.backgroundColorTwo, 
            ProjectColor.backgroundColor,
          ],
          begin: Alignment.topLeft, // Başlangıç noktası
          end: Alignment.bottomRight, // Bitiş noktası
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Gölgenin rengi
            blurRadius: 10, // Gölgenin bulanıklığı
            spreadRadius: 2, // Gölgenin yayılma alanı
            offset: Offset(4, 4), // Gölgenin konumu (x, y)
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            ListTileTheme(
              textColor: ProjectColor.textColor,
              iconColor: ProjectColor.textColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Text(
                        'M',
                        style: TextStyle(color: ProjectColor.textColor),
                      ),
                    ),
                    title: Text(user?.email ?? 'E-posta bulunamadı'),
                    subtitle: Text(user?.uid ?? 'qwert'),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Ana Sayfa'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'home-view');
                    },
                  ),
                  Divider(),
                  DovizWidget(dovisBilgisi: dovisBilgisi),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, 'account');
                    },
                    leading: Icon(CupertinoIcons.settings),
                    title: Text('Hesap Detayları'),
                  ),
                  Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DovizWidget extends StatelessWidget {
  const DovizWidget({
    super.key,
    required this.dovisBilgisi,
  });

  final List<Doviz> dovisBilgisi;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      
      leading: Icon(CupertinoIcons.money_dollar), // Kategori ikonu
      title: Text('Döviz Kurları'),
      trailing: Icon(CupertinoIcons.down_arrow),
      children: [
        Container(
          height: 200, // Çocukların yükseklik sınırını ayarlayın
          child: ListView.builder(
            itemCount: dovisBilgisi.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dovisBilgisi[index].name!),
                trailing: Text(
                  dovisBilgisi[index].buying.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ), // İlgili döviz bilgisi
                onTap: () {
                  // Tıklama işlevi
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
