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
      required this.onTap}) : super(key: key);

  @override
  State<PromotionsCard> createState() => _PromotionsCardState();
}

class _PromotionsCardState extends State<PromotionsCard> {
  final String defaultImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Ink(
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
    );
  }
}
