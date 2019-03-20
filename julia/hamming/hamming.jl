function distance(s1::AbstractString, s2::AbstractString)
  len = length(s1)
  len != length(s2) && throw(ArgumentError("Strings should be the same length."))

  d = 0
  for i = 1:len
    if s1[i] != s2[i]
      d += 1
    end
  end
  d
end
