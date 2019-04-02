function raindrops(number::Int)
    PAIRS = [
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong"),
    ]
    map(t -> number % t[1] == 0 ? t[2] : "" , PAIRS) |> join |> str -> maximum(["$number", str])
end
