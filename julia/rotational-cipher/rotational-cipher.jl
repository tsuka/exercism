function rotate(n::Int, c::AbstractChar)
    if 'a' <= c <= 'z'
        mod((c - 'a' + n), 26) + 'a'
    elseif 'A' <= c <= 'Z'
        mod((c - 'A' + n), 26) + 'A'
    else
        c
    end
end


function rotate(n::Int, str::AbstractString)
    map(i -> rotate(n, str[i]), 1:length(str)) |> join
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
