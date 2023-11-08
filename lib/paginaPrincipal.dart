import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tattoo_finder/login.dart';

class paginaPrincipal extends StatefulWidget {
  const paginaPrincipal({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<paginaPrincipal> {
  final TextEditingController searchController = TextEditingController();
  final List<Category> categories = [
    Category(
      title: 'Categoria 1',
      imageAssetPath: 'assets/img/banner1.png',
      imageName: 'Tribal',
    ),
    Category(
      title: 'Categoria 2',
      imageAssetPath: 'assets/img/banner2.png',
      imageName: 'Desenho',
    ),
    Category(
      title: 'Categoria 3',
      imageAssetPath: 'assets/img/banner3.png',
      imageName: 'Realista',
    ),
    Category(
      title: 'Categoria 4',
      imageAssetPath: 'assets/img/Finder.png',
      imageName: 'Novidades',
    ),
  ];

  final List<Category> otherItems = [
    Category(
      title: 'Item 1',
      imageAssetPath: 'assets/img/banner1.png',
      imageName: 'Tribal',
    ),
    Category(
      title: 'Item 2',
      imageAssetPath: 'assets/img/banner2.png',
      imageName: 'Desenhos',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: AspectRatio(
                aspectRatio: 4 / 2,
                child: Image.asset(
                  "assets/img/FinderLogo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Ação ao clicar no ícone de pesquisa
                      },
                    ),
                  ),
                ],
              ),
            ),

            BannerCarousel(),
            SizedBox(height: 16.0), // Espaçamento entre seções
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categorias',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: categories.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(category: categories[index]);
              },
            ),
            SizedBox(height: 16.0), // Espaçamento entre seções
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Outras Categorias',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: otherItems.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(category: otherItems[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

class Category {
  final String title;
  final String imageAssetPath;
  final String imageName;

  Category(
      {required this.title,
      required this.imageAssetPath,
      required this.imageName});
}

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Ação ao tocar no item da categoria
        },
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                  category.imageAssetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              category.imageName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  static const List<String> bannerAssetPaths = [
    'assets/img/banner.png',
    'assets/img/banner.png',
    'assets/img/banner.png',
  ];

  late PageController _pageController;
  int activePage = 0;
  bool timerActive = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: activePage,
    );
    _startTime();
  }

  void _startTime() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (timerActive) {
        if (activePage < bannerAssetPaths.length - 1) {
          activePage++;
        } else {
          activePage = 0;
        }
        _pageController.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
            itemCount: bannerAssetPaths.length,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return CardItem(imageAssetPath: bannerAssetPaths[pagePosition]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(bannerAssetPaths.length, activePage),
        ),
        Center(
          child: IconButton(
            onPressed: () {
              setState(() {
                timerActive = !timerActive;
              });
            },
            icon: timerActive
                ? const Icon(
                    Icons.pause,
                    size: 30,
                    color: Colors.black26,
                  )
                : const Icon(
                    Icons.play_arrow,
                    size: 30,
                  ),
          ),
        ),
      ],
    );
  }

  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class CardItem extends StatelessWidget {
  final String imageAssetPath;

  CardItem({required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 6 / 4,
        child: Stack(
          children: [
            Image.asset(
              imageAssetPath,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 70,
              child: ClipRect(
                child: Container(
                  color: Color.fromARGB(255, 26, 25, 25).withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dicas de Tatuagens',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            // Ação ao pressionar o botão
                          },
                          child: Text('Clique aqui'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
