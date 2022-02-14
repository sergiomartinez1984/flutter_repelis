// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepelisApp(),
    );
  }
}

class RepelisApp extends StatefulWidget {
  const RepelisApp({Key? key}) : super(key: key);

  @override
  _RepelisAppState createState() => _RepelisAppState();
}

class _RepelisAppState extends State<RepelisApp> {
  List<String> movieCarousselUrl = [
    "https://i.blogs.es/00bae3/matrixposters.0/1366_2000.jpeg",
    "https://i.blogs.es/59473f/witcher/1366_2000.jpeg",
    "https://vader.news/__export/1589889635924/sites/gadgets/img/2020/05/19/stranger-things-season-4-the-buzz-paper-2-1280x720_1.jpg_1187729725.jpg",
    "https://elvortex.com/wp-content/uploads/2017/09/MHA_kabegami_A-1.png",
    "https://www.nostagefright.net/wp-content/uploads/2018/11/animalesfantasticos2.jpg",
  ];

  List<String> movieTitle = [
    "Matrix Resurrection",
    "The Witcher temporada2",
    "Stranger Things",
    "My Hero Academy",
    "Animales Fantasticos"
  ];

  List<String> movieImageUrl = [
    "https://lumiere-a.akamaihd.net/v1/images/p_mulan2020_20204_b005decc.jpeg?region=0,0,540,810",
    "https://upload.wikimedia.org/wikipedia/en/2/21/Kimetsu_no_Yaiba_Mugen_Ressha_Hen_Poster.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/91e9898R7QL._RI_.jpg",
    "https://pics.filmaffinity.com/Spider_Man_No_Way_Home-387287198-large.jpg",
    "https://sm.ign.com/t/ign_es/gallery/a/arcane-cha/arcane-character-posters_yrxw.1080.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        centerTitle: true,
        title: const Text("Repelis",
            style: TextStyle(
              color: Colors.red,
            )),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lo Mas Destacado",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.9,
                  height: 280.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  sliderItem(movieCarousselUrl[0], movieTitle[0]),
                  sliderItem(movieCarousselUrl[1], movieTitle[1]),
                  sliderItem(movieCarousselUrl[2], movieTitle[2]),
                  sliderItem(movieCarousselUrl[3], movieTitle[3]),
                  sliderItem(movieCarousselUrl[4], movieTitle[4]),
                ],
              ),
              botonera(),
              const Text("Recomendados para ti",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 360.0,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listItem(movieImageUrl[0], "Mulan"),
                    listItem(movieImageUrl[1], "Demon Slayer Infinite Train"),
                    listItem(movieImageUrl[2], "Avengers EndGame"),
                    listItem(movieImageUrl[3], "SpiderMan No Way Home"),
                    listItem(movieImageUrl[4], "Arcane,League of Legends"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navInferior(),
    );
  }

  Widget botonera() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: const <Widget>[
            Icon(Icons.check, color: Colors.white),
            Text(
              'Mi lista',
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            )
          ],
        ),
        FlatButton.icon(
            onPressed: () {},
            color: Colors.yellow,
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
            label: const Text('reproducir')),
        Column(
          children: const <Widget>[
            Icon(Icons.info_outline, color: Colors.white),
            Text(
              'Informacion',
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            )
          ],
        ),
      ],
    );
  }

  BottomNavigationBar navInferior() {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.yellowAccent,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio')),
        BottomNavigationBarItem(
            icon: Icon(Icons.download), title: Text('Descargas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text('Favoritos')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Cuenta'))
      ],
    );
  }

  Widget sliderItem(String img, String movieName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          movieName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget listItem(String img, String movieName) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0),
      width: 180.0,
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280.0,
            width: 180.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            movieName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
