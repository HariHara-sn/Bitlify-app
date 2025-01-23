// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../core/utils/widgets/product_card.dart';
// import '../controllers/product_controller.dart';


// class ProductDetailScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productAsyncValue = ref.watch(productProvider);

//     return Scaffold(
//       appBar: AppBar(title: Text('Choose Your Bike')),
//       body: productAsyncValue.when(
//         data: (products) => ListView.builder(
//           itemCount: products.length,
//           itemBuilder: (context, index) => ProductCard(),
//         ),
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }
