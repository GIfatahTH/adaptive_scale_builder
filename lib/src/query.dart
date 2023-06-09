class Query {
  final double step, scale;
  final double? w0, y0;
  final bool isLinear;

  Query.internal({
    required this.step,
    required this.scale,
    required this.isLinear,
    required this.w0,
    required this.y0,
  });

  factory Query.constant({
    double step = double.infinity,
    double scale = 1,
  }) {
    return Query.internal(
      step: step,
      scale: scale,
      w0: null,
      y0: null,
      isLinear: false,
    );
  }

  double fn(width, q) {
    if (!isLinear) {
      final s = step == double.infinity ? 420 : step;
      final r = (q.w0 ?? s) * scale;
      return r;
    }

    final r = scale * (width - (q.y0 ?? 0)) + (q.w0 ?? 0);
    return r;
  }

  factory Query.linear({
    double step = double.infinity,
    double scale = 1,
  }) {
    return Query.internal(
      step: step,
      scale: scale,
      w0: null,
      y0: null,
      isLinear: true,
    );
  }
}
