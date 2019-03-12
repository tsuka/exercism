function rotate(n::Int, str::Union{AbstractString,AbstractChar})
    ischar = isa(str, Char)
    lower = join('a':'z')
    upper = join('A':'Z')
    from = lower * upper
    to = make_str(lower, n) * make_str(upper, n)
    str |> join |> s -> split(s, "") |>
    s -> map(s) do s
        idx = findfirst(s, from)
        idx !== nothing ? SubString(to, idx) : s
    end |> join |> s -> ischar ? s[1] : s
end

make_str(str, n) = SubString(str, n+1) * SubString(str, 1, n)

macro R13_str(str)
    rotate(13, str)
end
