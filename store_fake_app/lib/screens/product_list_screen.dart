import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/api_service.dart';
import '../widgets/product_card.dart';
import '../widgets/shopping_cart.dart';
import '../widgets/theme_button.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;
  String _searchText = ''; // 검색어를 저장하는 변수

  @override
  void initState() {
    super.initState();
    products = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
        actions: [ThemeButton(), ShoppingCart()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
          ),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        // null인 경우의 처리를 코드 앞부분에 배치
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
          // DK: 로딩 아이콘 표시
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List products = snapshot.data as List<Product>;
        if (_searchText.isNotEmpty) {
          products = products
              .where(
                (product) => product.title.toLowerCase().contains(
                      _searchText.toLowerCase(),
                    ),
              )
              .toList();
        }
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}
