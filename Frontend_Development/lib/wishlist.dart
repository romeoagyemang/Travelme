import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class Destination {
  final String name;
  final String image;

  Destination(this.name, this.image);
}

class WishlistProvider extends ChangeNotifier {
  List<Destination> wishlist = [];

  void addToWishlist(Destination destination) {
    wishlist.add(destination);
    notifyListeners();
  }

  void removeFromWishlist(Destination destination) {
    wishlist.remove(destination);
    notifyListeners();
  }
}

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlist = context.read<WishlistProvider>().wishlist;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final destination = wishlist[index];
          return ListTile(
            leading: Image.network(destination.image),
            title: Text(destination.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context
                    .read<WishlistProvider>()
                    .removeFromWishlist(destination);
              },
            ),
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Wishlist App'),
        ),
        body: WishlistScreen(),
      ),
    );
  }
}
