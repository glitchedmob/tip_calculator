import 'package:material_ui/material_ui.dart';

class AppExpansionTile extends StatefulWidget {
  final Widget header;
  final List<Widget> children;
  final GestureTapCallback? onHeaderTap;
  final bool expanded;

  const AppExpansionTile({
    super.key,
    required this.header,
    required this.children,
    this.onHeaderTap,
    this.expanded = false,
  });

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  final _controller = ExpansibleController();

  @override
  void initState() {
    super.initState();
    _updateExpansion();
  }

  @override
  void didUpdateWidget(AppExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expanded != widget.expanded) {
      _updateExpansion();
    }
  }

  void _updateExpansion() {
    if (widget.expanded) {
      _controller.expand();
    } else {
      _controller.collapse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.secondary,
        // Preserve the fork's header spacing, transparent borders and motion.
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Expansible(
            controller: _controller,
            animationStyle: const AnimationStyle(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
            ),
            maintainState: false,
            headerBuilder: (context, animation) {
              return Semantics(
                button: true,
                expanded: widget.expanded,
                child: InkWell(
                  onTap: widget.onHeaderTap,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: widget.header,
                        ),
                      ),
                      RotationTransition(
                        turns: animation.drive(
                          Tween<double>(
                            begin: 0,
                            end: 0.5,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 11,
                          ),
                          child: Icon(Icons.expand_more),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            bodyBuilder: (context, animation) => SizedBox(
              width: double.infinity,
              child: Column(children: widget.children),
            ),
          ),
        ),
      ),
    );
  }
}
