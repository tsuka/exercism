function rotate(n::Int, c::AbstractChar)
    isletter(c) || return c
    basechar = isuppercase(c) ? 'A' : 'a'
    return (c - basechar + n) % 26 + basechar
end

rotate(n::Int, str::AbstractString) = map(c -> rotate(n, c), str)

0:26 |> nums -> map(nums) do num
    macro_name = Symbol("R$(num)_str")
    eval(quote
        macro $macro_name(str)
            rotate($num, str)
        end
    end)
end
