import 'package:flutter/material.dart';
import 'package:universities/models/university_model.dart';

class InfiniteScrollwidget extends StatefulWidget {
  const InfiniteScrollwidget({
    super.key,
    required this.universities,
    required this.defineChild,
    required this.setController,
  });

  final List<UniversityModel> universities;
  final Function(List<UniversityModel> universities) defineChild;
  final Function(ScrollController) setController;

  @override
  State<InfiniteScrollwidget> createState() => _InfiniteScrollwidgetState();
}

class _InfiniteScrollwidgetState extends State<InfiniteScrollwidget> {
  late final ScrollController _controller;
  late List<UniversityModel> currentUniversities;
  int maxItemIndex = 20;
  bool loading = false;

  @override
  initState() {
    super.initState();
    _init();
  }

  _init() {
    _initController();
    _setSubUniversities();
  }

  _initController() {
    _controller = ScrollController();
    widget.setController(_controller);
    _controller.addListener(
      () {
        if (widget.universities.length > currentUniversities.length) {
          if ((_controller.position.pixels >=
                  (_controller.position.maxScrollExtent - 10)) &&
              !loading) {
            _addChildrens();
          }
        }
      },
    );
  }

  _addChildrens() {
    setState(() {
      loading = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
    Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () {
        setState(() {
          maxItemIndex += 20;
          currentUniversities = widget.universities.sublist(
              0,
              maxItemIndex > widget.universities.length
                  ? widget.universities.length
                  : maxItemIndex);
        });
      },
    ).whenComplete(
      () {
        setState(() {
          loading = false;
        });
      },
    );
  }

  _setSubUniversities() {
    if (widget.universities.length < maxItemIndex) {
      currentUniversities = widget.universities;
    } else {
      currentUniversities = widget.universities.sublist(0, maxItemIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        widget.defineChild(currentUniversities),
        if (loading)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
