def convert(number):
  ans = ""
  if number % 3 == 0:
    ans += "Pling"
  if number % 5 == 0:
    ans += "Plang"
  if number % 7 == 0:
    ans += "Plong"

  return str(number) if len(ans) == 0 else ans
