enum TranscriptionError: Error {
  case invalidNucleotide(String)
}

struct Nucleotide {
  static let transMap = [
    "G" : "C",
    "C" : "G",
    "T" : "A",
    "A" : "U",
  ]

  var complement: String

  init(_ dna: String) throws {
    self.complement = try Nucleotide.trans(dna: dna)
  }

  func complementOfDNA() -> String {
    return self.complement
  }

  static func trans(dna: String) throws -> String {
    var complement = ""
    for (r, d) in dna.map({(transMap[String($0)], $0)}) {
      if r != nil {
        complement += r!
      } else {
        throw TranscriptionError.invalidNucleotide("\(d) is not a valid Nucleotide")
      }
    }
    return complement
  }
}
