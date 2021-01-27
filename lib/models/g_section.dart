class GoldenSection {
  double _a;
  double _b;
  double _ab;
  double goldenRatio = 1.618;
  double get a => _a;
  double get b => _b;
  double get ab => _ab;

  GoldenSection() {
    _a = 1;
    _b = 0.618;
    _ab = 1.618;
  }

  void set a(value) =>{_a = a};
  void set b(value) =>{_a = a};
  void set ab(value) =>{_a = a};

}
