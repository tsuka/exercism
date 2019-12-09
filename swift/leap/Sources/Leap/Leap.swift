struct Year {
  var isLeapYear: Bool

  init(calendarYear: Int) {
    self.isLeapYear = calendarYear % 400 == 0 || (calendarYear % 4 == 0 && calendarYear % 100 != 0)
  }
}
