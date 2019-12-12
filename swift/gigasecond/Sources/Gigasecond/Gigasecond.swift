import Foundation

struct Gigasecond {
  let description: String

  init?(from datestr: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let date = dateFormatter.date(from: datestr)
    if date != nil {
      self.description = dateFormatter.string(from: date! + 1000000000)
    } else {
      return nil
    }
  }
}
