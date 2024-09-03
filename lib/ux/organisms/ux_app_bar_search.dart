import 'package:flutter/material.dart';

class UxAppBarSearch extends StatefulWidget implements PreferredSizeWidget {

  final Widget widgetTitle;
  final Function(String value) onSubmitted;
  final Function()? onPressedUserIcon;

  const UxAppBarSearch({
    required this.widgetTitle,
    required this.onSubmitted,
    super.key,
    this.onPressedUserIcon
  });

  @override
  State<UxAppBarSearch> createState() => _UxAppBarSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _UxAppBarSearchState extends State<UxAppBarSearch> {
  bool _isExpanded = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode myFocusNode = FocusNode();
  late Widget title = widget.widgetTitle;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        title = TextField(
          focusNode: myFocusNode,
          onSubmitted: (value){
            if (value.isEmpty) {
              myFocusNode.requestFocus();
              return;
            }
            widget.onSubmitted(value);
          },
          textInputAction: TextInputAction.search,
          autofocus: true,
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Buscar...',
            border: InputBorder.none,
          )
        );
        myFocusNode.requestFocus();
      } else {
        title = widget.widgetTitle;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: title
      ),
      leading: IconButton(
        icon: Icon(_isExpanded ? Icons.arrow_back : Icons.search,
          size: 30,
          weight: 10.0,
        ),
        onPressed: _toggleExpand,
      ),
      actions: [
        if (!_isExpanded)
          IconButton(
            icon: const Icon(Icons.person,
              size: 30,
              weight: 10.0,
            ),
            onPressed: widget.onPressedUserIcon
          ),
        if (_isExpanded)
          IconButton(
            icon: const Icon(Icons.close,
              size: 30,
              weight: 10.0,
            ),
            onPressed: _toggleExpand,
          ),
      ],
    );
  }
}