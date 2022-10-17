extension CollectionsExtentsions on List {
  /// ? Add value to list if doesn't exist else replace Current Value
  void addOrReplace(model) {
    if (contains(model)) {
      insert(indexOf(model), model);
      removeAt(indexOf(model));
    } else {
      add(model);
    }
  }

  ///? Set Value At index
  void replace(model, int index) {
    if (index < length) {
      insert(index, model);
      removeAt(indexOf(model) + 1);
    } else {
      throw Exception('Index Out Of Boundaries');
    }
  }
}
