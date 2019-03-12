function rotate(n::Int, str::Union{AbstractString,AbstractChar})
    ischar = isa(str, Char)
    lower = join('a':'z')
    upper = join('A':'Z')
    from = lower * upper
    to = make_str(lower, n) * make_str(upper, n)

    if ischar
        str = String([str])
    end

    split(str, "") |>
    letters -> map(letters) do letter
        idx = findfirst(letter, from)
        idx !== nothing ? SubString(to, idx) : letter
    end |> join |> rotated -> ischar ? rotated[1] : rotated
end

make_str(str, n) = SubString(str, n+1) * SubString(str, 1, n)


0:26 |> nums -> map(nums) do num
    macro_name = Symbol("R$(num)_str")
    eval(quote
        macro $macro_name(str)
            rotate($num, str)
        end
    end)
end
