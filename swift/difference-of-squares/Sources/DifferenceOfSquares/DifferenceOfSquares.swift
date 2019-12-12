import Foundation

struct Squares {
  let squareOfSum: Decimal
  let sumOfSquares: Decimal
  let differenceOfSquares: Decimal

  init(_ num: Int) {
    self.squareOfSum = pow(Decimal((1...num).reduce(0, +)), 2)
    self.sumOfSquares = (1...num).reduce(0.0, {acc, n in acc + pow(Decimal(n), 2)})
    self.differenceOfSquares = self.squareOfSum - self.sumOfSquares
  }
}
