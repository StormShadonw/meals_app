import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Map<String, bool> currentFilters;

  final Function saveFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
      {bool value, Function setStateHandler, String title, String subTitle}) {
    return SwitchListTile(
      value: value,
      onChanged: setStateHandler,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters["gluten"];
    _lactoseFree = widget.currentFilters["lactose"];
    _vegan = widget.currentFilters["vegan"];
    _vegetarian = widget.currentFilters["vegetarian"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    title: "Gluten-free",
                    subTitle: "Only include gluten-free meals",
                    value: _glutenFree,
                    setStateHandler: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                _buildSwitchListTile(
                  title: "Vegetarian",
                  subTitle: "Only include vegetarian meals",
                  value: _vegetarian,
                  setStateHandler: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                    title: "Vegan",
                    subTitle: "Only include vegan meals",
                    value: _vegan,
                    setStateHandler: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                _buildSwitchListTile(
                  title: "Lactose-Free",
                  subTitle: "Only include lactose-free meals",
                  value: _lactoseFree,
                  setStateHandler: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
