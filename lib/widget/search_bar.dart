import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  bool enabled = true;
  bool hideLeft = false;
  SearchBarType type = SearchBarType.normal;
  String hint = "";
  String defaulText = "";

  void Function()? leftBtnClick;
  void Function()? rightBtnClick;
  void Function()? speackClick;
  void Function()? inputBoxClick;
  ValueChanged<String>? onChange;

  SearchBar({
    Key? key,
    this.enabled = true,
    this.hideLeft = true,
    this.type = SearchBarType.normal,
    this.hint = "",
    this.defaulText = '',
    this.leftBtnClick,
    this.rightBtnClick,
    this.inputBoxClick,
    this.onChange,
    this.speackClick,
  }) : super(key: key);

  // SearchBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  bool showClear = false;
  @override
  void initState() {
    if (widget.defaulText != null) {
      setState(() {
        _controller.text = widget.defaulText;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isNormalType ? _genNormalSearch() : _genHomeSearch();
  }

  Widget _genNormalSearch() {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
            child: _wrapTap(
                Container(
                  child: widget.hideLeft
                      ? null
                      : const Icon(Icons.arrow_back_ios,
                          color: Colors.grey, size: 26),
                ),
                widget.leftBtnClick),
          ),
          Expanded(child: _inputBox, flex: 1),
          _wrapTap(
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: const Text('搜索',
                    style: TextStyle(color: Colors.blue, fontSize: 17)),
              ),
              widget.rightBtnClick)
        ],
      ),
    );
  }

  Widget _genHomeSearch() {
    return Container();
  }

  Widget _wrapTap(Widget? child, void Function()? callback) {
    return GestureDetector(
      onTap: callback,
      child: child,
    );
  }

  bool get isNormalType {
    return (widget.type == SearchBarType.normal);
  }

  bool get isHomeType {
    return (widget.type == SearchBarType.home);
  }

  Widget get _inputBox {
    Color inputBoxColor = widget.type == SearchBarType.home
        ? Colors.white
        : Color(int.parse('0xffededed'));
    return Container(
      height: 50,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(isNormalType ? 5 : 25)),
      child: Row(
        children: [
          Icon(Icons.search,
              size: 20,
              color: isNormalType ? const Color(0xffa9a9a9a) : Colors.blue),
          Expanded(
              child: isNormalType
                  ? TextField(
                      controller: _controller,
                      onChanged: widget.onChange,
                      autofocus: true,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          border: InputBorder.none,
                          hintText: widget.hint,
                          hintStyle: const TextStyle(fontSize: 15)),
                    )
                  : _wrapTap(
                      Text(
                        widget.defaulText,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      widget.inputBoxClick)),
          !showClear
              ? _wrapTap(
                  Icon(Icons.mic,
                      size: 22,
                      color: isNormalType ? Colors.blue : Colors.grey),
                  widget.speackClick)
              : _wrapTap(
                  const Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ), () {
                  setState(() {
                    _controller.clear();
                    _onChange();
                  });
                })
        ],
      ),
    );
  }

  _onChange() {
    showClear = false;
  }
}
