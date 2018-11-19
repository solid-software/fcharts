
import 'package:fcharts/src/utils/painting.dart';
import 'package:fcharts/src/utils/span.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// A bar graph, in the context of fcharts at least, is a chart which is
/// represented using rectangular bars, and often groups or even stacks of
/// those bars. It can be in the form of a bar chart (for categorical/
/// discrete data), or a histogram (continuous data).

/// A bar in a histogram.
@immutable
@deprecated
class BinData {
  const BinData({
    @required this.value,
    this.paint: const [const PaintOptions.fill(color: Colors.black)],
    this.paintGenerator,
  });

  /// The value for this bin.
  final double value;

  /// The paint to use on the bar of this bin.
  final List<PaintOptions> paint;

  /// An option paint generator to use for the bar of this bin. This overrides
  /// [paint].
  final PaintGenerator paintGenerator;
}

/// A group of bar stacks in a bar chart.
@immutable
@deprecated
class BarGroupData {
  const BarGroupData({
    @required this.stacks,
    @required this.stackWidthFraction,
  });

  /// The stacks of this group.
  final List<BarStackData> stacks;

  /// The width of each stack. A value of 1.0 means that stacks take up
  /// 100% of their width, there is no spacing between them.
  final double stackWidthFraction;

  BarGroupData copyWith({
    List<BarStackData> stacks,
    double stackWidthFraction,
  }) {
    return new BarGroupData(
      stacks: stacks ?? this.stacks,
      stackWidthFraction: stackWidthFraction ?? this.stackWidthFraction,
    );
  }
}

/// A vertical group of bars in a bar chart.
@immutable
@deprecated
class BarStackData {
  const BarStackData({
    @required this.bars,
    @required this.range,
    @required this.base,
  });

  /// The bars of this stack.
  final List<BarData> bars;

  /// The range of this bar stack. Values for each bar are calculated
  /// relative to this range.
  final DoubleSpan range;

  /// The "base" value of this stack. It is typically 0 since many bar charts
  /// start at 0, however, some bar charts are based around a different
  /// value.
  final double base;

  BarStackData copyWith({
    List<BarData> bars,
    DoubleSpan range,
    double base,
  }) {
    return new BarStackData(
      bars: bars ?? this.bars,
      range: range ?? this.range,
      base: base ?? this.base,
    );
  }
}

/// A single continuous bar in a bar chart.
@immutable
@deprecated
class BarData {
  const BarData({
    @required this.value,
    @required this.base,
    this.paint: const [const PaintOptions.fill(color: Colors.black)],
    this.paintGenerator,
  });

  /// The value of this bar. It is usually something like the "height" or
  /// how far it extends vertically. It is relative to the bar stack's range.
  final double value;

  /// The "base" of this bar. It is relative to the bar stack's range. For bar
  /// charts which have a single bar per stack, this should probably be equal
  /// to the range's min value.
  final double base;

  /// Paint to use on this bar.
  final List<PaintOptions> paint;

  /// An optional paint generator to use on this bar. This overrides [paint].
  final PaintGenerator paintGenerator;

  BarData copyWith({
    double value,
    double base,
    List<PaintOptions> paint,
    PaintGenerator paintGenerator,
  }) {
    return new BarData(
      value: value ?? this.value,
      base: base ?? this.base,
      paint: paint ?? this.paint,
      paintGenerator: paintGenerator ?? this.paintGenerator,
    );
  }
}
