function raindrops(number::Int)
    str = ""
    if number % 3 == 0
        str *= "Pling"
    end
    if number % 5 == 0
        str *= "Plang"
    end
    if number % 7 == 0
        str *= "Plong"
    end
    str == "" ?  "$number" : str
end
