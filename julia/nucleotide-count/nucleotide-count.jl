function count_nucleotides(strand::AbstractString)
    count = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for c in strand
        haskey(count, c) || throw(DomainError("invalid nucleotide"))
        count[c] += 1
    end
    return count
end
