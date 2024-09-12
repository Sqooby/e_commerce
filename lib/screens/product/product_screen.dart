// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:e_commerce/models/models.dart';

import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  final Product product;

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: const CustomBottomBar(screen: routeName),
      body: ListView(children: [
        // photo with product
        CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              )
            ]),

        //Name and price of product
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.bottomCenter,
              color: Colors.black.withAlpha(50),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width - 10,
              height: 60,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${product.price}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),

        // product details
        const CustomExpanionTile(
          title: 'Product Information',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis augue est. Phasellus vitae tortor eu lorem facilisis fermentum nec sit amet risus. Vestibulum consequat eget odio vitae tristique. Maecenas.',
        ),

        const CustomExpanionTile(
          title: 'Delivery Information',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis augue est. Phasellus vitae tortor eu lorem facilisis fermentum nec sit amet risus. Vestibulum consequat eget odio vitae tristique. Maecenas.',
        ),
      ]),
    );
  }
}

class CustomExpanionTile extends StatelessWidget {
  final String title;
  final String text;
  const CustomExpanionTile({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        children: [
          ListTile(
            title: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          )
        ],
      ),
    );
  }
}
