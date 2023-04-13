import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 = Color(0xFFFEDBD0);
const kShrinePink300 = Color(0xFFFBB8AC);
const kShrinePink400 = Color(0xFFEAA4A4);
const kShrineBrown900 = Color(0xFF442B2D);
const kShrineErrorRed = Color(0xFFC5032B);
const kShrineSurfaceWhite = Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

final ThemeData _kShrineTheme = _buildShrineTheme();
ThemeData _buildShrineTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
  colorScheme: base.colorScheme.copyWith(
  primary: kShrinePink100,
    onPrimary: kShrineBrown900,
    secondary: kShrineBrown900,
    error: kShrineErrorRed,
  ),
  );
}



void main() => runApp(const HomePageApp());

class HomePageApp extends StatefulWidget {
  const HomePageApp({super.key});
  @override
  State<HomePageApp> createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _kShrineTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              semanticLabel: "Menu",
            ),
          ),
          title: const Center(child: Text("SHRINE")),
          actions: <Widget>[
            const SizedBox(width: 15),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, semanticLabel: "Search"),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune, semanticLabel: "Filter"),
            ),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isDark = !isDark;
//                 });
//               },
//               icon: isDark
//                   ? const Icon(Icons.light_mode, color: Colors.amber)
//                   : const Icon(Icons.dark_mode, color: Colors.black54),
//             ),
          ],
        ),
        body: const Center(child: HomePageClass()),
      ),
    );
  }
}

class HomePageClass extends StatefulWidget {
  const HomePageClass({super.key});
  @override
  State<HomePageClass> createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  @override
  Widget build(BuildContext context) {
   List<Card> _buildGridCards(BuildContext context) {
  List<Product> products = ProductsRepository.loadProducts(Category.all);

  if (products.isEmpty) {
    return const <Card>[];
  }

  final ThemeData theme = Theme.of(context);
  final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString());

  return products.map((product) {
    return Card(
      clipBehavior: Clip.antiAlias,
      // TODO: Adjust card heights (103)
      child:Center(child: Column(
        // TODO: Center items on the card (103)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18 / 11,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
               // TODO: Align labels to the bottom and center (103)
               crossAxisAlignment: CrossAxisAlignment.start,
                // TODO: Change innermost Column (103)
                children: <Widget>[
                 // TODO: Handle overflowing labels (103)
                 Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),),
    );
  }).toList();
}


    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      childAspectRatio: 8 / 9,
      children: _buildGridCards(context),
    );
  }
}

enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  String get assetName => '$id-0.jpg';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Vagabond sack',
        price: 120,
      ),
      Product(
        category: Category.accessories,
        id: 1,
        isFeatured: true,
        name: 'Stella sunglasses',
        price: 58,
      ),
      Product(
        category: Category.accessories,
        id: 2,
        isFeatured: false,
        name: 'Whitney belt',
        price: 35,
      ),
      Product(
        category: Category.accessories,
        id: 3,
        isFeatured: true,
        name: 'Garden strand',
        price: 98,
      ),
      Product(
        category: Category.accessories,
        id: 4,
        isFeatured: false,
        name: 'Strut earrings',
        price: 34,
      ),
      Product(
        category: Category.accessories,
        id: 5,
        isFeatured: false,
        name: 'Varsity socks',
        price: 12,
      ),
      Product(
        category: Category.accessories,
        id: 6,
        isFeatured: false,
        name: 'Weave keyring',
        price: 16,
      ),
      Product(
        category: Category.accessories,
        id: 7,
        isFeatured: true,
        name: 'Gatsby hat',
        price: 40,
      ),
      Product(
        category: Category.accessories,
        id: 8,
        isFeatured: true,
        name: 'Shrug bag',
        price: 198,
      ),
      Product(
        category: Category.home,
        id: 9,
        isFeatured: true,
        name: 'Gilt desk trio',
        price: 58,
      ),
      Product(
        category: Category.home,
        id: 10,
        isFeatured: false,
        name: 'Copper wire rack',
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 11,
        isFeatured: false,
        name: 'Soothe ceramic set',
        price: 28,
      ),
      Product(
        category: Category.home,
        id: 12,
        isFeatured: false,
        name: 'Hurrahs tea set',
        price: 34,
      ),
      Product(
        category: Category.home,
        id: 13,
        isFeatured: true,
        name: 'Blue stone mug',
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 14,
        isFeatured: true,
        name: 'Rainwater tray',
        price: 27,
      ),
      Product(
        category: Category.home,
        id: 15,
        isFeatured: true,
        name: 'Chambray napkins',
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 16,
        isFeatured: true,
        name: 'Succulent planters',
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 17,
        isFeatured: false,
        name: 'Quartet table',
        price: 175,
      ),
      Product(
        category: Category.home,
        id: 18,
        isFeatured: true,
        name: 'Kitchen quattro',
        price: 129,
      ),
      Product(
        category: Category.clothing,
        id: 19,
        isFeatured: false,
        name: 'Clay sweater',
        price: 48,
      ),
      Product(
        category: Category.clothing,
        id: 20,
        isFeatured: false,
        name: 'Sea tunic',
        price: 45,
      ),
      Product(
        category: Category.clothing,
        id: 21,
        isFeatured: false,
        name: 'Plaster tunic',
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 22,
        isFeatured: false,
        name: 'White pinstripe shirt',
        price: 70,
      ),
      Product(
        category: Category.clothing,
        id: 23,
        isFeatured: false,
        name: 'Chambray shirt',
        price: 70,
      ),
      Product(
        category: Category.clothing,
        id: 24,
        isFeatured: true,
        name: 'Seabreeze sweater',
        price: 60,
      ),
      Product(
        category: Category.clothing,
        id: 25,
        isFeatured: false,
        name: 'Gentry jacket',
        price: 178,
      ),
      Product(
        category: Category.clothing,
        id: 26,
        isFeatured: false,
        name: 'Navy trousers',
        price: 74,
      ),
      Product(
        category: Category.clothing,
        id: 27,
        isFeatured: true,
        name: 'Walter henley (white)',
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 28,
        isFeatured: true,
        name: 'Surf and perf shirt',
        price: 48,
      ),
      Product(
        category: Category.clothing,
        id: 29,
        isFeatured: true,
        name: 'Ginger scarf',
        price: 98,
      ),
      Product(
        category: Category.clothing,
        id: 30,
        isFeatured: true,
        name: 'Ramona crossover',
        price: 68,
      ),
      Product(
        category: Category.clothing,
        id: 31,
        isFeatured: false,
        name: 'Chambray shirt',
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 32,
        isFeatured: false,
        name: 'Classic white collar',
        price: 58,
      ),
      Product(
        category: Category.clothing,
        id: 33,
        isFeatured: true,
        name: 'Cerise scallop tee',
        price: 42,
      ),
      Product(
        category: Category.clothing,
        id: 34,
        isFeatured: false,
        name: 'Shoulder rolls tee',
        price: 27,
      ),
      Product(
        category: Category.clothing,
        id: 35,
        isFeatured: false,
        name: 'Grey slouch tank',
        price: 24,
      ),
      Product(
        category: Category.clothing,
        id: 36,
        isFeatured: false,
        name: 'Sunshirt dress',
        price: 58,
      ),
      Product(
        category: Category.clothing,
        id: 37,
        isFeatured: true,
        name: 'Fine lines tee',
        price: 58,
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
