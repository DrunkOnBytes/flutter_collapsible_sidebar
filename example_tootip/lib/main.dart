import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collapsible Sidebar with Tooltip Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SidebarTooltip(),
    );
  }
}

class SidebarTooltip extends StatefulWidget {
  const SidebarTooltip({super.key});

  @override
  State<SidebarTooltip> createState() => _SidebarTooltipState();
}

class _SidebarTooltipState extends State<SidebarTooltip> {
  // map from which to generate some CollapsibleItems
  final itemMap = {
    "First": Icons.home_outlined,
    "Second": Icons.settings_outlined,
    "Third": Icons.abc,
    "No tip!": Icons.block_outlined,
  };
  String selected = "First";

  @override
  Widget build(BuildContext context) {
    final List<CollapsibleItem> itemList = itemMap.keys.map((i) {
      return CollapsibleItem(
        isSelected: i == selected,
        text: i,
        icon: itemMap[i],
        // explicitly avoid a tooltip on that last item, just 'coz we can
        toolTip: i != itemMap.keys.last ? "$i item" : null,
        onPressed: () {
          setState(() => selected = i);
        },
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sidebar with Tips"),
      ),
      body: CollapsibleSidebar(
        items: itemList,
        showTitle: false,
        body: Center(child: Text(selected)),
      ),
    );
  }
}
