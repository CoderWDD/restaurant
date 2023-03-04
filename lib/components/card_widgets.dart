import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';

class PromotionsCard extends StatefulWidget {
  final String? url;
  final String title;
  final String description;
  final String price;
  final VoidCallback? onTap;

  const PromotionsCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.price,
      this.url,
      required this.onTap})
      : super(key: key);

  @override
  State<PromotionsCard> createState() => _PromotionsCardState();
}

class _PromotionsCardState extends State<PromotionsCard> {
  final String defaultImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.px3pt),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.px3pt),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(13.px3pt),
          onTap: widget.onTap,
          child: SizedBox(
            height: 82.px3pt,
            width: 239.px3pt,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 9.px3pt),
                  child: SizedBox(
                    width: 64.px3pt,
                    height: 64.px3pt,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.px3pt),
                      child: Image.network(
                        widget.url ?? defaultImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.px3pt),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.px3pt,
                          fontFamily: 'PoppinsMedium',
                          color: const Color(0xFF121212),
                        ),
                      ),
                      SizedBox(height: 2.px3pt),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 12.px3pt,
                          height: 1.6,
                          fontFamily: 'PoppinsRegular',
                          color: const Color(0xFFAAAAAA),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 2.px3pt),
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontSize: 14.px3pt,
                          height: 1.6,
                          fontFamily: 'PoppinsMedium',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFF68F24),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final String? description;
  final String? price;
  final String? url;
  final String defaultImageUrl =
      'https://docs.flutter.dev/assets/images/docs/ui/layout/layout-4.png';

  const CategoriesCard(
      {Key? key,
      this.onTap,
      this.title,
      this.description,
      this.price,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.px3pt, right: 15.px3pt, top: 12.px3pt),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.px3pt),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(13.px3pt),
          onTap: onTap ?? () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.px3pt),
                child: SizedBox(
                  width: 76.px3pt,
                  height: 76.px3pt,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.px3pt),
                    child: Image.network(
                      url ?? defaultImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title ?? 'title',
                        style: TextStyle(
                          color: const Color(0xFF121212),
                          fontFamily: 'PoppinsMedium',
                          fontSize: 16.px3pt,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description ?? 'description',
                        style: TextStyle(
                          color: const Color(0xFFAAAAAA),
                          fontFamily: 'PoppinsNormal',
                          fontSize: 12.px3pt,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.px3pt),
                child: Text(
                  price ?? '\$0.00',
                  style: TextStyle(
                    color: const Color(0xFFFF9A51),
                    fontFamily: 'PoppinsMedium',
                    fontSize: 14.px3pt,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientsCard extends StatefulWidget {
  final String? ingredientUrl;
  final String? ingredientName;

  const IngredientsCard(
      {Key? key, required this.ingredientUrl, required this.ingredientName})
      : super(key: key);

  @override
  State<IngredientsCard> createState() => _IngredientsCardState();
}

class _IngredientsCardState extends State<IngredientsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.px3pt),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.px3pt),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(13.px3pt),
          child: SizedBox(
            width: 100.px3pt,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 64.px3pt,
                  height: 64.px3pt,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.px3pt),
                    child: Image.network(widget.ingredientUrl ?? '',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }, errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 8.px3pt),
                Text(
                  widget.ingredientName ?? '',
                  style: TextStyle(
                    color: const Color(0xFF7D7871),
                    fontFamily: 'PoppinsMedium',
                    fontSize: 12.px3pt,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
