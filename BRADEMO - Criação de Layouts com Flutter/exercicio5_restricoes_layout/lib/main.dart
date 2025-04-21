import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examples of Layout Constraints',
      home: LayoutExamples(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LayoutExamples extends StatefulWidget {
  const LayoutExamples({super.key});

  @override
  _LayoutExamplesState createState() => _LayoutExamplesState();
}

class _LayoutExamplesState extends State<LayoutExamples> {
  int _exampleNumber = 1;

  final List<String> exampleDescriptions = [
    "",
    "The screen is the parent of the Container, and it forces the Container to be exactly the same size as the screen. So the Container fills the screen and paints it red.",
    "The red Container wants to be 100 x 100, but it can't, because the screen forces it to be exactly the same size as the screen. So the Container fills the screen.",
    "The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen. The Center tells the Container that it can be any size it wants, but not bigger than the screen. Now the Container can indeed be 100 × 100.",
    "This is different from the previous example in that it uses Align instead of Center. Align also tells the Container that it can be any size it wants, but if there is empty space it won't center the Container. Instead, it aligns the container to the bottom-right of the available space.",
    "The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen. The Center tells the Container that it can be any size it wants, but not bigger than the screen. The Container wants to be of infinite size, but since it can't be bigger than the screen, it just fills the screen.",
    "The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen. The Center tells the Container that it can be any size it wants, but not bigger than the screen. Since the Container has no child and no fixed size, it decides it wants to be as big as possible, so it fills the whole screen. But why does the Container decide that? Simply because that's a design decision by those who created the Container widget. It could have been created differently, and you have to read the Container API documentation to understand how it behaves, depending on the circumstances.",
    "The screen forces the Center to be exactly the same size as the screen, so the Center fills the screen. The Center tells the red Container that it can be any size it wants, but not bigger than the screen. Since the red Container has no size but has a child, it decides it wants to be the same size as its child. The red Container tells its child that it can be any size it wants, but not bigger than the screen. The child is a green Container that wants to be 30 × 30. Given that the red Container sizes itself to the size of its child, it is also 30 × 30. The red color isn't visible because the green Container entirely covers the red Container.",
    "The red Container sizes itself to its children's size, but it takes its own padding into consideration. So it is also 30 × 30 plus padding. The red color is visible because of the padding, and the green Container has the same size as in the previous example.",
    "You might guess that the Container has to be between 70 and 150 pixels, but you would be wrong. The ConstrainedBox only imposes additional constraints from those it receives from its parent. Here, the screen forces the ConstrainedBox to be exactly the same size as the screen, so it tells its child Container to also assume the size of the screen, thus ignoring its constraints parameter.",
    "Now, Center allows ConstrainedBox to be any size up to the screen size. The ConstrainedBox imposes additional constraints from its constraints parameter onto its child. The Container must be between 70 and 150 pixels. It wants to have 10 pixels, so it ends up having 70 (the minimum).",
    "Center allows ConstrainedBox to be any size up to the screen size. The ConstrainedBox imposes additional constraints from its constraints parameter onto its child. The Container must be between 70 and 150 pixels. It wants to have 1000 pixels, so it ends up having 150 (the maximum).",
    "Center allows ConstrainedBox to be any size up to the screen size. The ConstrainedBox imposes additional constraints from its constraints parameter onto its child. The Container must be between 70 and 150 pixels. It wants to have 100 pixels, and that's the size it has, since that's between 70 and 150.",
    "The screen forces the UnconstrainedBox to be exactly the same size as the screen. However, the UnconstrainedBox lets its child Container be any size it wants.",
    "The screen forces the UnconstrainedBox to be exactly the same size as the screen, and UnconstrainedBox lets its child Container be any size it wants. Unfortunately, in this case the Container is 4000 pixels wide and is too big to fit in the UnconstrainedBox, so the UnconstrainedBox displays the much dreaded "
        "overflow warning"
        ".",
    "The screen forces the OverflowBox to be exactly the same size as the screen, and OverflowBox lets its child Container be any size it wants. OverflowBox is similar to UnconstrainedBox; the difference is that it won't display any warnings if the child doesn't fit the space. In this case, the Container has 4000 pixels of width, and is too big to fit in the OverflowBox, but the OverflowBox simply shows as much as it can, with no warnings given.",
    "This won't render anything, and you'll see an error in the console. The UnconstrainedBox lets its child be any size it wants, however its child is a Container with infinite size. Flutter can't render infinite sizes, so it throws an error with the following message: BoxConstraints forces an infinite width.",
    "Here you won't get an error anymore, because when the LimitedBox is given an infinite size by the UnconstrainedBox; it passes a maximum width of 100 down to its child. If you swap the UnconstrainedBox for a Center widget, the LimitedBox won't apply its limit anymore (since its limit is only applied when it gets infinite constraints), and the width of the Container is allowed to grow past 100. This explains the difference between a LimitedBox and a ConstrainedBox.",
    "The screen forces the FittedBox to be exactly the same size as the screen. The Text has some natural width (also called its intrinsic width) that depends on the amount of text, its font size, and so on. The FittedBox lets the Text be any size it wants, but after the Text tells its size to the FittedBox, the FittedBox scales the Text until it fills all of the available width.",
    "But what happens if you put the FittedBox inside of a Center widget? The Center lets the FittedBox be any size it wants, up to the screen size. The FittedBox then sizes itself to the Text, and lets the Text be any size it wants. Since both FittedBox and the Text have the same size, no scaling happens.",
    "However, what happens if FittedBox is inside of a Center widget, but the Text is too large to fit the screen? FittedBox tries to size itself to the Text, but it can't be bigger than the screen. It then assumes the screen size, and resizes Text so that it fits the screen, too.",
    "If, however, you remove the FittedBox, the Text gets its maximum width from the screen, and breaks the line so that it fits the screen.",
    "FittedBox can only scale a widget that is bounded (has non-infinite width and height). Otherwise, it won't render anything, and you'll see an error in the console.",
    "The screen forces the Row to be exactly the same size as the screen. Just like an UnconstrainedBox, the Row won't impose any constraints onto its children, and instead lets them be any size they want. The Row then puts them side-by-side, and any extra space remains empty.",
    "Since Row won't impose any constraints onto its children, it's quite possible that the children might be too big to fit the available width of the Row. In this case, just like an UnconstrainedBox, the Row displays the "
        "overflow warning"
        ".",
    "When a Row's child is wrapped in an Expanded widget, the Row won't let this child define its own width anymore. Instead, it defines the Expanded width according to the other children, and only then the Expanded widget forces the original child to have the Expanded's width. In other words, once you use Expanded, the original child's width becomes irrelevant, and is ignored.",
    "If all of Row's children are wrapped in Expanded widgets, each Expanded has a size proportional to its flex parameter, and only then each Expanded widget forces its child to have the Expanded's width. In other words, Expanded ignores the preferred width of its children.",
    "The only difference if you use Flexible instead of Expanded, is that Flexible lets its child have the same or smaller width than the Flexible itself, while Expanded forces its child to have the exact same width of the Expanded. But both Expanded and Flexible ignore their children's width when sizing themselves. This means that it's impossible to expand Row children proportionally to their sizes. The Row either uses the exact child's width, or ignores it completely when you use Expanded or Flexible.",
    "The screen forces the Scaffold to be exactly the same size as the screen, so the Scaffold fills the screen. The Scaffold tells the Container that it can be any size it wants, but not bigger than the screen. When a widget tells its child that it can be smaller than a certain size, we say the widget supplies loose constraints to its child. More on that later.",
    "If you want the Scaffold's child to be exactly the same size as the Scaffold itself, you can wrap its child with SizedBox.expand.",
  ];

  String _getExampleDescription(int number) {
    if (number >= 1 && number < exampleDescriptions.length) {
      return exampleDescriptions[number];
    }
    return "";
  }

  Widget _buildExampleWidget() {
    switch (_exampleNumber) {
      case 1:
        return Container(color: Colors.red);
      case 2:
        return Container(width: 100, height: 100, color: Colors.red);
      case 3:
        return Center(
          child: Container(width: 100, height: 100, color: Colors.red),
        );
      case 4:
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(width: 100, height: 100, color: Colors.red),
        );
      case 5:
        return Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
        );
      case 6:
        return Center(child: Container(color: Colors.red));
      case 7:
        return Center(
          child: Container(
            color: Colors.red,
            child: Container(color: Colors.green, width: 30, height: 30),
          ),
        );
      case 8:
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.red,
            child: Container(color: Colors.green, width: 30, height: 30),
          ),
        );
      case 9:
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 70,
            minHeight: 70,
            maxWidth: 150,
            maxHeight: 150,
          ),
          child: Container(color: Colors.red, width: 10, height: 10),
        );
      case 10:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 10, height: 10),
          ),
        );
      case 11:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 1000, height: 1000),
          ),
        );
      case 12:
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 150,
              maxHeight: 150,
            ),
            child: Container(color: Colors.red, width: 100, height: 100),
          ),
        );
      case 13:
        return UnconstrainedBox(
          child: Container(color: Colors.red, width: 20, height: 50),
        );
      case 14:
        return UnconstrainedBox(
          child: Container(color: Colors.red, width: 4000, height: 50),
        );
      case 15:
        return OverflowBox(
          minWidth: 0,
          minHeight: 0,
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Container(color: Colors.red, width: 4000, height: 50),
        );
      case 16:
        return UnconstrainedBox(
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: 100,
          ),
        );
      case 17:
        return UnconstrainedBox(
          child: LimitedBox(
            maxWidth: 100,
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: 100,
            ),
          ),
        );
      case 18:
        return const FittedBox(child: Text('Some Example Text.'));
      case 19:
        return const Center(
          child: FittedBox(child: Text('Some Example Text.')),
        );
      case 20:
        return const Center(
          child: FittedBox(
            child: Text(
              'This is some very very very large text that is too big to fit a regular screen in a single line.',
            ),
          ),
        );
      case 21:
        return const Center(
          child: Text(
            'This is some very very very large text that is too big to fit a regular screen in a single line.',
          ),
        );
      case 22:
        return FittedBox(
          child: Container(
            height: 20,
            width: double.infinity,
            color: Colors.red,
          ),
        );
      case 23:
        return Row(
          children: [
            Container(
              color: Colors.red,
              child: const Text('Hello!', style: TextStyle(fontSize: 30)),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: TextStyle(fontSize: 30)),
            ),
          ],
        );
      case 24:
        return Row(
          children: [
            Container(
              color: Colors.red,
              child: const Text(
                'This is a very long text that '
                'won\'t fit the line.',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: TextStyle(fontSize: 30)),
            ),
          ],
        );
      case 25:
        return Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  color: Colors.red,
                  child: const Text(
                    'This is a very long text that won\'t fit the line.',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Text('Goodbye!', style: TextStyle(fontSize: 30)),
            ),
          ],
        );
      case 26:
        return Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: const Text(
                  'This is a very long text that won\'t fit the line.',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: const Text('Goodbye!', style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        );
      case 27:
        return Row(
          children: [
            Flexible(
              child: Container(
                color: Colors.red,
                child: const Text(
                  'This is a very long text that won\'t fit the line.',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Flexible(
              child: Container(
                color: Colors.green,
                child: const Text('Goodbye!', style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        );
      case 28:
        return Scaffold(
          body: Container(
            color: Colors.blue,
            child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
          ),
        );
      case 29:
        return Scaffold(
          body: SizedBox.expand(
            child: Container(
              color: Colors.blue,
              child: const Column(children: [Text('Hello!'), Text('Goodbye!')]),
            ),
          ),
        );
      default:
        return const Center(
          child: Text('Exemplo inválido!', style: TextStyle(color: Colors.red)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example $_exampleNumber'),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              setState(() {
                if (_exampleNumber > 1) _exampleNumber--;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              setState(() {
                if (_exampleNumber < exampleDescriptions.length - 1) {
                  _exampleNumber++;
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _getExampleDescription(_exampleNumber),
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Center(child: _buildExampleWidget())),
        ],
      ),
    );
  }
}
