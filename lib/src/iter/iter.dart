abstract class IterView<T> {
  factory IterView(Iterable<T> iterable) => new IterViewImpl<T>(iterable);

  int get length;

  T operator [](int index);

  Iterable<T> get asIterable;

  List<T> toList();

  T get first;

  T get last;
}

abstract class IterFix<T> implements IterView<T> {
  factory IterFix(Iterable<T> iterable) => new IterFixImpl<T>(iterable);

  operator []=(int index, T v);
}

abstract class Iter<T> implements IterFix<T> {
  factory Iter(Iterable<T> iterable) => new IterImpl<T>(iterable);

  void add(T v);

  void remove(T v);

  void removeAt(int pos);

  void insert(int pos, T v);
}

class IterViewImpl<T> implements IterView<T> {
  final Iterable<T> asIterable;

  const IterViewImpl(Iterable<T> iterable) : asIterable = iterable;

  int get length => asIterable.length;

  T operator [](int index) => asIterable.elementAt(index);

  T get first => asIterable.first;

  T get last => asIterable.last;

  List<T> toList() => asIterable.toList();
}

class IterFixImpl<T> implements IterFix<T> {
  final List<T> _asList;

  const IterFixImpl(List<T> list) : _asList = list;

  int get length => asIterable.length;

  T operator [](int index) => _asList[index];

  Iterable<T> get asIterable => _asList;

  List<T> toList() => _asList.toList();

  T get first => _asList.first;

  T get last => _asList.last;

  operator []=(int index, T v) {
    if(index >= length) throw new Exception('Fixed size list!');
    _asList[index] = v;
  }
}

class IterImpl<T> implements Iter<T> {
  final List<T> _list;

  const IterImpl(List<T> list) : _list = list;

  IterImpl.sized([int length = 0]): _list = new List<T>(length);

  IterImpl.from(iterable): _list = new List<T>(iterable.toList());

  int get length => asIterable.length;

  T operator [](int index) => _list[index];

  Iterable<T> get asIterable => _list;

  T get first => _list.first;

  T get last => _list.last;

  operator []=(int index, T v) => _list[index] = v;

  void add(T v) => _list.add(v);

  void remove(T v) => _list.remove(v);

  void removeAt(int pos) => _list.removeAt(pos);

  void insert(int pos, T v) => _list.insert(pos, v);

  List<T> toList() => _list.toList();
}