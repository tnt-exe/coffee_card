import 'package:coffee_card/styled_body_text.dart';
import 'package:coffee_card/styled_button.dart';
import 'package:flutter/material.dart';

class CoffeePrefs extends StatefulWidget {
  const CoffeePrefs({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}

class _CoffeePrefsState extends State<CoffeePrefs> {
  var strenght = 1;
  var sugars = 1;
  void increaseStrenght() {
    setState(() {
      strenght = strenght < 5 ? strenght + 1 : 1;
    });
  }

  void increaseSugar() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const StyledBodyText("Strenght: "),
            for (int i = 0; i < strenght; i++)
              Image.asset(
                "assets/img/coffee_bean.png",
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),
            const Expanded(
              child: SizedBox(),
            ),
            StyledButton(
              onPressed: increaseStrenght,
              child: const Text("+"),
            ),
          ],
        ),
        Row(
          children: [
            const StyledBodyText("Sugars: "),
            if (sugars == 0) const StyledBodyText("No sugars..."),
            for (int i = 0; i < sugars; i++)
              Image.asset(
                "assets/img/sugar_cube.png",
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),
            const Expanded(
              child: SizedBox(),
            ),
            StyledButton(
              onPressed: increaseSugar,
              child: const Text("+"),
            ),
          ],
        ),
      ],
    );
  }
}
