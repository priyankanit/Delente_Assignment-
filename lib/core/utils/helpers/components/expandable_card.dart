import 'package:flutter/material.dart';

import '../../constants/image_constants.dart';

class ExpandableCard extends StatefulWidget {
  final int index;
  const ExpandableCard({super.key, required this.index});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  final List<String> cardImages = [
    ImageConstants.img1,
    ImageConstants.img2,
    ImageConstants.img3,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(15.0),
        height: _isExpanded ? 200 : 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: _isExpanded
            ? Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        cardImages[widget.index % cardImages.length],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  'Card ${widget.index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
      ),
    );
  }
}
