library hijri_picker;

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'hijri_calendar.dart';

const double _kMonthPickerPortraitWidth = 330.0;
const double _kMonthPickerLandscapeWidth = 344.0;
const double _kDatePickerHeaderPortraitHeight = 100.0;
const double _kDatePickerHeaderLandscapeWidth = 168.0;
const double _kDayPickerRowHeight = 42.0;
const int _kMaxDayPickerRowCount = 6; // A 31 day month that starts on Saturday.
const double _kDialogActionBarHeight = 52.0;
const double _kDatePickerLandscapeHeight =
    _kMaxDayPickerHeight + _kDialogActionBarHeight;
// Two extra rows: one for the day-of-week header and one for the month header.
const double _kMaxDayPickerHeight =
    _kDayPickerRowHeight * (_kMaxDayPickerRowCount + 2);
const Duration _kMonthScrollDuration = const Duration(milliseconds: 200);

/// Signature for predicating dates for enabled date selections.
///
/// See [showDatePicker].
typedef bool SelectableDayPredicate(HijriCalendar day);

class HijriDatePickerDialog extends StatefulWidget {
  const HijriDatePickerDialog({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.selectableDayPredicate,
    required this.initialDatePickerMode,
  }) : super(key: key);

  final HijriCalendar initialDate;
  final HijriCalendar firstDate;
  final HijriCalendar lastDate;
  final SelectableDayPredicate? selectableDayPredicate;
  final DatePickerMode initialDatePickerMode;

  @override
  _DatePickerDialogState createState() => new _DatePickerDialogState();
}

class _DatePickerDialogState extends State<HijriDatePickerDialog> {
  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _mode = widget.initialDatePickerMode;
  }

  bool _announcedInitialDate = false;

  late MaterialLocalizations localizations;
  late TextDirection textDirection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = MaterialLocalizations.of(context);
    textDirection = Directionality.of(context);
    if (!_announcedInitialDate) {
      _announcedInitialDate = true;
      SemanticsService.announce(
        _selectedDate.toString(),
        textDirection,
      );
    }
  }

  late HijriCalendar _selectedDate;
  late DatePickerMode _mode;
  final GlobalKey _pickerKey = new GlobalKey();

  void _vibrate() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        HapticFeedback.vibrate();
        break;
      case TargetPlatform.iOS:
        break;
      case TargetPlatform.linux:
        break;
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.windows:
        break;
    }
  }

  void _handleModeChanged(DatePickerMode mode) {
    _vibrate();
    setState(() {
      _mode = mode;
      if (_mode == DatePickerMode.day) {
        SemanticsService.announce(_selectedDate.toString(), textDirection);
      } else {
        SemanticsService.announce(_selectedDate.toString(), textDirection);
      }
    });
  }

  void _handleYearChanged(HijriCalendar value) {
    _vibrate();
    setState(() {
      _mode = DatePickerMode.day;
      _selectedDate = value;
    });
  }

  void _handleDayChanged(HijriCalendar value) {
    _vibrate();
    setState(() {
      _selectedDate = value;
    });
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  void _handleOk() {
    Navigator.pop(context, _selectedDate);
  }

  Widget _buildPicker() {
    switch (_mode) {
      case DatePickerMode.day:
        return new HijriMonthPicker(
          key: _pickerKey,
          selectedDate: _selectedDate,
          onChanged: _handleDayChanged,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          selectableDayPredicate: widget.selectableDayPredicate,
        );
      case DatePickerMode.year:
        return new HijriYearPicker(
          key: _pickerKey,
          selectedDate: _selectedDate,
          onChanged: _handleYearChanged,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);

    final Widget picker = new Flexible(
      child: new SizedBox(
        height: _kMaxDayPickerHeight,
        child: _buildPicker(),
      ),
    );
    final Widget actions = new ButtonBarTheme(
      data: ButtonBarThemeData(),
      child: new ButtonBar(
        children: <Widget>[
          new TextButton(
            child: new Text(localizations.cancelButtonLabel),
            onPressed: _handleCancel,
          ),
          new TextButton(
            child: new Text(localizations.okButtonLabel),
            onPressed: _handleOk,
          ),
        ],
      ),
    );
    final Dialog dialog = new Dialog(child: new OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final Widget header = new _DatePickerHeader(
            hSelectedDate: _selectedDate,
            mode: _mode,
            onModeChanged: _handleModeChanged,
            orientation: orientation,
          );
          switch (orientation) {
            case Orientation.portrait:
              return new SizedBox(
                width: _kMonthPickerPortraitWidth,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header,
                    new Container(
                      color: theme.dialogBackgroundColor,
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          picker,
                          actions,
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case Orientation.landscape:
              return new SizedBox(
                height: _kDatePickerLandscapeHeight,
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header,
                    new Flexible(
                      child: new Container(
                        width: _kMonthPickerLandscapeWidth,
                        color: theme.dialogBackgroundColor,
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[picker, actions],
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        }));

    return new Theme(
      data: theme.copyWith(
        dialogBackgroundColor: Colors.transparent,
      ),
      child: dialog,
    );
  }
}

// Shows the selected date in large font and toggles between year and day mode
class _DatePickerHeader extends StatelessWidget {
  const _DatePickerHeader({
    Key? key,
    required this.hSelectedDate,
    required this.mode,
    required this.onModeChanged,
    required this.orientation,
  }) : super(key: key);

  final HijriCalendar hSelectedDate;
  final DatePickerMode mode;
  final ValueChanged<DatePickerMode> onModeChanged;
  final Orientation orientation;

  void _handleChangeMode(DatePickerMode value) {
    if (value != mode) onModeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme headerTextTheme = themeData.primaryTextTheme;
    Color dayColor;
    Color yearColor;
    switch (themeData.brightness) {
      case Brightness.light:
        dayColor = mode == DatePickerMode.day ? Colors.black87 : Colors.black54;
        yearColor =
        mode == DatePickerMode.year ? Colors.black87 : Colors.black54;
        break;
      case Brightness.dark:
        dayColor = mode == DatePickerMode.day ? Colors.white : Colors.white70;
        yearColor = mode == DatePickerMode.year ? Colors.white : Colors.white70;
        break;
    }
    final TextStyle? dayStyle =
    headerTextTheme.headlineMedium?.copyWith(color: dayColor, height: 1.4);
    final TextStyle? yearStyle =
    headerTextTheme.titleMedium?.copyWith(color: yearColor, height: 1.4);

    Color backgroundColor;
    switch (themeData.brightness) {
      case Brightness.light:
        backgroundColor = themeData.primaryColor;
        break;
      case Brightness.dark:
        backgroundColor = themeData.colorScheme.background;
        break;
    }

    double? width;
    double? height;
    EdgeInsets? padding;
    MainAxisAlignment? mainAxisAlignment;
    switch (orientation) {
      case Orientation.portrait:
        height = _kDatePickerHeaderPortraitHeight;
        padding = const EdgeInsets.symmetric(horizontal: 16.0);
        mainAxisAlignment = MainAxisAlignment.center;
        break;
      case Orientation.landscape:
        width = _kDatePickerHeaderLandscapeWidth;
        padding = const EdgeInsets.all(8.0);
        mainAxisAlignment = MainAxisAlignment.start;
        break;
    }

    final Widget yearButton = new IgnorePointer(
      ignoring: mode != DatePickerMode.day,
      ignoringSemantics: false,
      child: new _DateHeaderButton(
        color: backgroundColor,
        onTap: Feedback.wrapForTap(
                () => _handleChangeMode(DatePickerMode.year), context),
        child: new Semantics(
          selected: mode == DatePickerMode.year,
          child: new Text("${hSelectedDate.hYear}", style: yearStyle),
        ),
      ),
    );

    final Widget dayButton = new IgnorePointer(
      ignoring: mode == DatePickerMode.day,
      ignoringSemantics: false,
      child: new _DateHeaderButton(
        color: backgroundColor,
        onTap: Feedback.wrapForTap(
                () => _handleChangeMode(DatePickerMode.day), context),
        child: new Semantics(
          selected: mode == DatePickerMode.day,
          child: new Text("${hSelectedDate.toFormat("DD,dd MMMM")}",
              style: dayStyle),
        ),
      ),
    );

    return new Container(
      width: width,
      height: height,
      padding: padding,
      color: backgroundColor,
      child: new Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[yearButton, dayButton],
      ),
    );
  }
}

class _DateHeaderButton extends StatelessWidget {
  const _DateHeaderButton({
    Key? key,
    this.onTap,
    this.color,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Material(
      type: MaterialType.button,
      color: color,
      child: new InkWell(
        borderRadius: kMaterialEdges[MaterialType.button],
        highlightColor: theme.highlightColor,
        splashColor: theme.splashColor,
        onTap: onTap,
        child: new Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: child,
        ),
      ),
    );
  }
}

class HijriMonthPicker extends StatefulWidget {
  /// Creates a month picker.
  ///
  /// Rarely used directly. Instead, typically used as part of the dialog shown
  /// by [showDatePicker].
  HijriMonthPicker({
    Key? key,
    required this.selectedDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
    this.selectableDayPredicate,
  })  : assert(
  !firstDate.isAfter(lastDate.hYear, lastDate.hMonth, lastDate.hDay)),
  /*  assert(selectedDate.isAfter(
                firstDate.hYear, firstDate.hMonth, firstDate.hDay) ||
            selectedDate.isAtSameMomentAs(
                firstDate.hYear, firstDate.hMonth, firstDate.hDay)),*/
        super(key: key);

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final HijriCalendar selectedDate;

  /// Called when the user picks a month.
  final ValueChanged<HijriCalendar> onChanged;

  /// The earliest date the user is permitted to pick.
  final HijriCalendar firstDate;

  /// The latest date the user is permitted to pick.
  final HijriCalendar lastDate;

  /// Optional user supplied predicate function to customize selectable days.
  final SelectableDayPredicate? selectableDayPredicate;

  @override
  _HijriMonthPickerState createState() => new _HijriMonthPickerState();
}

class _HijriMonthPickerState extends State<HijriMonthPicker> {
  @override
  void initState() {
    super.initState();
    // Initially display the pre-selected date.
    final int monthPage = _monthDelta(widget.firstDate, widget.selectedDate);
    _dayPickerController = new PageController(initialPage: monthPage);
    _handleMonthPageChanged(monthPage);
    _updateCurrentDate();
  }

  @override
  void didUpdateWidget(HijriMonthPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.selectedDate.isAtSameMomentAs(oldWidget.selectedDate.hYear,
        oldWidget.selectedDate.hMonth, oldWidget.selectedDate.hDay)) {
      final int monthPage = _monthDelta(widget.firstDate, widget.selectedDate);
      _dayPickerController = new PageController(initialPage: monthPage);
      _handleMonthPageChanged(monthPage);
    }
  }

  late MaterialLocalizations localizations;
  late TextDirection textDirection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = MaterialLocalizations.of(context);
    textDirection = Directionality.of(context);
  }

  late HijriCalendar _todayDate;
  late HijriCalendar _currentDisplayedMonthDate;
  Timer? _timer;
  PageController? _dayPickerController;

  void _updateCurrentDate() {
    _todayDate = new HijriCalendar.now();
    final HijriCalendar tomorrow = new HijriCalendar()
      ..hYear = _todayDate.hYear
      ..hMonth = _todayDate.hMonth
      ..hDay = _todayDate.hDay + 1;
    Duration timeUntilTomorrow = tomorrow
        .hijriToGregorian(tomorrow.hYear, tomorrow.hMonth, tomorrow.hDay)
        .difference(_todayDate.hijriToGregorian(
        _todayDate.hYear,
        _todayDate.hMonth,
        _todayDate.hDay)); //tomorrow.difference(_todayDate);
    timeUntilTomorrow +=
    const Duration(seconds: 1); // so we don't miss it by rounding
    _timer?.cancel();
    _timer = new Timer(timeUntilTomorrow, () {
      setState(() {
        _updateCurrentDate();
      });
    });
  }

  static int _monthDelta(HijriCalendar startDate, HijriCalendar endDate) {
    return (endDate.hYear - startDate.hYear) * 12 +
        endDate.hMonth -
        startDate.hMonth;
  }

  /// Add months to a month truncated date.
  HijriCalendar _addMonthsToMonthDate(
      HijriCalendar monthDate, int monthsToAdd) {
    var x = new HijriCalendar.addMonth(
        monthDate.hYear + (monthDate.hMonth + monthsToAdd) ~/ 12,
        monthDate.hMonth + monthsToAdd % 12);
    return x;
  }

  Widget _buildItems(BuildContext context, int index) {
    final month = _addMonthsToMonthDate(widget.firstDate, index);
    return new HijriDayPicker(
      key: new ValueKey<HijriCalendar>(month),
      selectedDate: widget.selectedDate,
      currentDate: _todayDate,
      onChanged: widget.onChanged,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      displayedMonth: month,
      selectableDayPredicate: widget.selectableDayPredicate,
    );
  }

  void _handleNextMonth() {
    if (!_isDisplayingLastMonth) {
      SemanticsService.announce(
          (_nextMonthDate.hMonth.toString()), textDirection);
      _dayPickerController?.nextPage(
          duration: _kMonthScrollDuration, curve: Curves.ease);
    }
  }

  void _handlePreviousMonth() {
    if (!_isDisplayingFirstMonth) {
      SemanticsService.announce(
          (_previousMonthDate.hMonth.toString()), textDirection);
      _dayPickerController?.previousPage(
          duration: _kMonthScrollDuration, curve: Curves.ease);
    }
  }

  /// True if the earliest allowable month is displayed.
  bool get _isDisplayingFirstMonth {
    return !_currentDisplayedMonthDate.isAfter(
        widget.firstDate.hYear, widget.firstDate.hMonth, widget.firstDate.hDay);
  }

  /// True if the latest allowable month is displayed.
  bool get _isDisplayingLastMonth {
    return !_currentDisplayedMonthDate.isBefore(
        widget.lastDate.hYear, widget.lastDate.hMonth, widget.lastDate.hDay);
  }

  late HijriCalendar _previousMonthDate;
  late HijriCalendar _nextMonthDate;

  void _handleMonthPageChanged(int monthPage) {
    setState(() {
      _previousMonthDate =
          _addMonthsToMonthDate(widget.firstDate, monthPage - 1);
      _currentDisplayedMonthDate =
          _addMonthsToMonthDate(widget.firstDate, monthPage);
      _nextMonthDate = _addMonthsToMonthDate(widget.firstDate, monthPage + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: _kMonthPickerPortraitWidth,
      height: _kMaxDayPickerHeight,
      child: new Stack(
        children: <Widget>[
          new Semantics(
            sortKey: _MonthPickerSortKey.calendar,
            child: new PageView.builder(
              key: new ValueKey<HijriCalendar>(widget.selectedDate),
              controller: _dayPickerController,
              scrollDirection: Axis.horizontal,
              itemCount: _monthDelta(widget.firstDate, widget.lastDate) + 1,
              itemBuilder: _buildItems,
              onPageChanged: _handleMonthPageChanged,
            ),
          ),
          new PositionedDirectional(
            top: 0.0,
            start: 8.0,
            child: new Semantics(
              sortKey: _MonthPickerSortKey.previousMonth,
              child: new IconButton(
                icon: const Icon(Icons.chevron_left),
                tooltip: _isDisplayingFirstMonth
                    ? null
                    : '${localizations.previousMonthTooltip} ${_previousMonthDate.toString()}',
                onPressed:
                _isDisplayingFirstMonth ? null : _handlePreviousMonth,
              ),
            ),
          ),
          new PositionedDirectional(
            top: 0.0,
            end: 8.0,
            child: new Semantics(
              sortKey: _MonthPickerSortKey.nextMonth,
              child: new IconButton(
                icon: const Icon(Icons.chevron_right),
                tooltip: _isDisplayingLastMonth
                    ? null
                    : '${localizations.nextMonthTooltip} ${_nextMonthDate.toString()}',
                onPressed: _isDisplayingLastMonth ? null : _handleNextMonth,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _dayPickerController?.dispose();
    super.dispose();
  }
}

// Defines semantic traversal order of the top-level widgets inside the month
// picker.
class _MonthPickerSortKey extends OrdinalSortKey {
  static const _MonthPickerSortKey previousMonth =
  const _MonthPickerSortKey(1.0);
  static const _MonthPickerSortKey nextMonth = const _MonthPickerSortKey(2.0);
  static const _MonthPickerSortKey calendar = const _MonthPickerSortKey(3.0);

  const _MonthPickerSortKey(double order) : super(order);
}

const int daysPerWeek = 7;

/// Displays the days of a given month and allows choosing a day.
///
/// The days are arranged in a rectangular grid with one column for each day of
/// the week.
///
/// The day picker widget is rarely used directly. Instead, consider using
/// [showDatePicker], which creates a date picker dialog.
///
/// See also:
///
///  * [showDatePicker].
///  * <https://material.google.com/components/pickers.html#pickers-date-pickers>
///
///

class _HijriDayPickerGridDelegate extends SliverGridDelegate {
  const _HijriDayPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double tileHeight = math.min(_kDayPickerRowHeight,
        constraints.viewportMainAxisExtent / (_kMaxDayPickerRowCount + 1));
    return new SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: tileHeight,
      crossAxisStride: tileWidth,
      childMainAxisExtent: tileHeight,
      childCrossAxisExtent: tileWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_HijriDayPickerGridDelegate oldDelegate) => false;
}

const _HijriDayPickerGridDelegate _kDayPickerGridDelegate =
const _HijriDayPickerGridDelegate();

class HijriDayPicker extends StatelessWidget {
  /// Creates a day picker.
  ///
  HijriDayPicker({
    Key? key,
    required this.selectedDate,
    required this.currentDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
    this.selectableDayPredicate,
    required this.displayedMonth,
  })  : assert(
  !firstDate.isAfter(lastDate.hYear, lastDate.hMonth, lastDate.hDay)),
        super(key: key);

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final HijriCalendar selectedDate;

  /// The current date at the time the picker is displayed.
  final HijriCalendar currentDate;

  /// Called when the user picks a day.
  final ValueChanged<HijriCalendar> onChanged;

  /// The earliest date the user is permitted to pick.
  final HijriCalendar firstDate;

  /// The latest date the user is permitted to pick.
  final HijriCalendar lastDate;

  /// The month whose days are displayed by this picker.
  final HijriCalendar displayedMonth;

  /// Optional user supplied predicate function to customize selectable days.
  final SelectableDayPredicate? selectableDayPredicate;

  List<Widget> _getDayHeaders(
      TextStyle? headerStyle, MaterialLocalizations localizations) {
    final List<Widget> result = <Widget>[];

    /// { 0 } pick first day of week as sunday
    for (int i = 0; true; i = (i + 1) % 7) {
      final String weekday = localizations.narrowWeekdays[i];
      result.add(new ExcludeSemantics(
        child: new Center(child: new Text(weekday, style: headerStyle)),
      ));

      /// { 0 } pick first day of week as sunday
      if (i == (0 - 1) % 7) break;
    }
    return result;
  }

  /// Returns the number of days in a month, according to the proleptic
  /// Gregorian calendar.
  ///
  /// This applies the leap year logic introduced by the Gregorian reforms of
  /// 1582. It will not give valid results for dates prior to that time.
  static int getDaysInMonth(int year, int month) {
    return HijriCalendar().getDaysInMonth(year, month);
  }

  int _computeFirstDayOffset(int year, int month) {
    var convertDate = new HijriCalendar();
    DateTime wkDay = convertDate.hijriToGregorian(year, month, 1);
    // 0-based day of week, with 0 representing Monday.
    final int weekdayFromMonday = wkDay.weekday - 1;
    // 0-based day of week, with 0 representing Sunday.
    final int firstDayOfWeekFromSunday = 0;
    // firstDayOfWeekFromSunday recomputed to be Monday-based
    final int firstDayOfWeekFromMonday = (firstDayOfWeekFromSunday - 1) % 7;
    // Number of days between the first day of week appearing on the calendar,
    // and the day corresponding to the 1-st of the month.
    return (weekdayFromMonday - firstDayOfWeekFromMonday) % 7;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MaterialLocalizations localizations =
    MaterialLocalizations.of(context);

    final int year = displayedMonth.hYear;
    final int month = displayedMonth.hMonth;
    final int daysInMonth = getDaysInMonth(year, month);
    final int firstDayOffset = _computeFirstDayOffset(year, month);
    final List<Widget> labels = <Widget>[];
    labels.addAll(_getDayHeaders(themeData.textTheme.bodySmall, localizations));
    for (int i = 0; true; i += 1) {
      final int day = i - firstDayOffset + 1;
      if (day > daysInMonth) break;
      if (day < 1) {
        labels.add(new Container());
      } else {
        final HijriCalendar dayToBuild = new HijriCalendar()
          ..hYear = year
          ..hMonth = month
          ..hDay = day;
        final bool disabled = dayToBuild.isAfter(
            lastDate.hYear, lastDate.hMonth, lastDate.hDay) ||
            dayToBuild.isBefore(
                firstDate.hYear, firstDate.hMonth, firstDate.hDay) ||
            (selectableDayPredicate != null &&
                !selectableDayPredicate!(dayToBuild));

        BoxDecoration? decoration;
        TextStyle? itemStyle = themeData.textTheme.bodyMedium;

        final bool isSelectedDay = selectedDate.hYear == year &&
            selectedDate.hMonth == month &&
            selectedDate.hDay == day;
        if (isSelectedDay) {
          // The selected day gets a circle background highlight, and a contrasting text color.
     //     itemStyle = themeData.accentTextTheme.bodyText1;
          decoration = new BoxDecoration(
              color: themeData.secondaryHeaderColor, shape: BoxShape.circle);
        } else if (disabled) {
          itemStyle = themeData.textTheme.bodyMedium
              ?.copyWith(color: themeData.disabledColor);
        } else if (currentDate.hYear == year &&
            currentDate.hMonth == month &&
            currentDate.hDay == day) {
          // The current day gets a different text color.
          itemStyle = themeData.textTheme.bodyLarge
              ?.copyWith(color: themeData.secondaryHeaderColor);
        }

        Widget dayWidget = new Container(
          decoration: decoration,
          child: new Center(
            child: new Semantics(
              // We want the day of month to be spoken first irrespective of the
              // locale-specific preferences or TextDirection. This is because
              // an accessibility user is more likely to be interested in the
              // day of month before the rest of the date, as they are looking
              // for the day of month. To do that we prepend day of month to the
              // formatted full date.
              label:
              '${localizations.formatDecimal(day)}, ${dayToBuild.toString()}',
              selected: isSelectedDay,
              child: new ExcludeSemantics(
                child: new Text(localizations.formatDecimal(day),
                    style: itemStyle),
              ),
            ),
          ),
        );

        if (!disabled) {
          dayWidget = new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onChanged(dayToBuild);
            },
            child: dayWidget,
          );
        }

        labels.add(dayWidget);
      }
    }

    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            height: _kDayPickerRowHeight,
            child: new Center(
              child: new ExcludeSemantics(
                child: new Text(
                  "${displayedMonth.toFormat("MMMM")} ${displayedMonth.hYear}",
                  style: themeData.textTheme.titleMedium,
                ),
              ),
            ),
          ),
          new Flexible(
            child: new GridView.custom(
              gridDelegate: _kDayPickerGridDelegate,
              childrenDelegate: new SliverChildListDelegate(labels,
                  addRepaintBoundaries: false),
            ),
          ),
        ],
      ),
    );
  }
}

/// A scrollable list of years to allow picking a year.
///
/// The year picker widget is rarely used directly. Instead, consider using
/// [showDatePicker], which creates a date picker dialog.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// See also:
///
///  * [showDatePicker]
///  * <https://material.google.com/components/pickers.html#pickers-date-pickers>
class HijriYearPicker extends StatefulWidget {
  /// Creates a year picker.
  ///
  /// The [selectedDate] and [onChanged] arguments must not be null. The
  /// [lastDate] must be after the [firstDate].
  ///
  /// Rarely used directly. Instead, typically used as part of the dialog shown
  /// by [showDatePicker].
  HijriYearPicker({
    Key? key,
    required this.selectedDate,
    required this.onChanged,
    required this.firstDate,
    required this.lastDate,
  })  : assert(
  !firstDate.isAfter(lastDate.hYear, lastDate.hMonth, lastDate.hDay)),
        super(key: key);

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final HijriCalendar selectedDate;

  /// Called when the user picks a year.
  final ValueChanged<HijriCalendar> onChanged;

  /// The earliest date the user is permitted to pick.
  final HijriCalendar firstDate;

  /// The latest date the user is permitted to pick.
  final HijriCalendar lastDate;

  @override
  _HijriYearPickerState createState() => new _HijriYearPickerState();
}

class _HijriYearPickerState extends State<HijriYearPicker> {
  static const double _itemExtent = 50.0;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController(
      // Move the initial scroll position to the currently selected date's year.
      initialScrollOffset:
      (widget.selectedDate.hYear - widget.firstDate.hYear) * _itemExtent,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final ThemeData themeData = Theme.of(context);
    final TextStyle? style = themeData.textTheme.bodyMedium;
    return new ListView.builder(
      controller: scrollController,
      itemExtent: _itemExtent,
      itemCount: widget.lastDate.hYear - widget.firstDate.hYear + 1,
      itemBuilder: (BuildContext context, int index) {
        final int year = widget.firstDate.hYear + index;
        final bool isSelected = year == widget.selectedDate.hYear;
        final TextStyle? itemStyle = isSelected
            ? themeData.textTheme.headlineSmall
            ?.copyWith(color: themeData.secondaryHeaderColor)
            : style;
        return new InkWell(
          key: new ValueKey<int>(year),
          onTap: () {
            // year, widget.selectedDate.hMonth, widget.selectedDate.hMonth
            widget.onChanged(new HijriCalendar()
              ..hYear = year
              ..hMonth = widget.selectedDate.hMonth
              ..hDay = widget.selectedDate.hDay);
          },
          child: new Center(
            child: new Semantics(
              selected: isSelected,
              child: new Text(year.toString(), style: itemStyle),
            ),
          ),
        );
      },
    );
  }
}

Future<HijriCalendar?> showHijriDatePicker({
  required BuildContext context,
  required HijriCalendar initialDate,
  required HijriCalendar firstDate,
  required HijriCalendar lastDate,
  SelectableDayPredicate? selectableDayPredicate,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  Locale? locale,
  TextDirection? textDirection,
}) async {
  assert(
  !initialDate.isBefore(firstDate.hYear, firstDate.hMonth, firstDate.hDay),
  'initialDate must be on or after firstDate');
  assert(!initialDate.isAfter(lastDate.hYear, lastDate.hMonth, lastDate.hDay),
  'initialDate must be on or before lastDate');
  assert(!firstDate.isAfter(lastDate.hYear, lastDate.hMonth, lastDate.hDay),
  'lastDate must be on or after firstDate');
  assert(selectableDayPredicate == null || selectableDayPredicate(initialDate),
  'Provided initialDate must satisfy provided selectableDayPredicate');

  Widget child = new HijriDatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    selectableDayPredicate: selectableDayPredicate,
    initialDatePickerMode: initialDatePickerMode,
  );

  if (textDirection != null) {
    child = new Directionality(
      textDirection: textDirection,
      child: child,
    );
  }

  if (locale != null) {
    child = new Localizations.override(
      context: context,
      locale: locale,
      child: child,
    );
  }

  return showDialog<HijriCalendar>(
    context: context,
    builder: (BuildContext context) => child,
  );
}
