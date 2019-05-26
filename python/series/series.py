def slices(series, length):
  if len(series) < length or length <= 0:
    raise ValueError("error")
  return list(map(lambda i: series[i:i+length], list(range(0, len(series)-length+1))))
