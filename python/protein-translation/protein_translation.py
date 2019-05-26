import re

trans_dict = {}
trans_list = [
  (["AUG"], "Methionine"),
  (["UUU", "UUC"], "Phenylalanine"),
  (["UUA", "UUG"], "Leucine"),
  (["UCU", "UCC", "UCA", "UCG"], "Serine"),
  (["UAU", "UAC"], "Tyrosine"),
  (["UGU", "UGC"], "Cysteine"),
  (["UGG"], "Tryptophan"),
  (["UAA", "UAG", "UGA"], "STOP"),
]
for codons, protein in trans_list:
  for codon in codons:
    trans_dict[codon] = protein

def proteins(strand):
  result = []
  for codon in re.findall(r'...', strand):
    protein = trans_dict[codon]
    if protein == "STOP":
      break
    else:
      result.append(protein)
  return result
