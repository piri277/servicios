import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis productos')),
      body: Column(
        children: [MisCategorias(), Divider(height: 2), MisProductos()],
      ),
    );
  }
}

class MisProductos extends StatelessWidget {
  const MisProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CategoryIcons(),
            title: Text('Producto #$index'),
            subtitle: Text('Descripción del producto'),
          );
        },
      ),
    );
  }
}

class MisCategorias extends StatelessWidget {
  const MisCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryIcons(),
        CategoryIcons(),
        CategoryIcons(),
        CategoryIcons(),
        CategoryIcons(),
        CategoryIcons(),
        CategoryIcons(),
      ],
    );
  }
}

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(radius: 20, child: Icon(Icons.card_travel)),
    );
  }
}
