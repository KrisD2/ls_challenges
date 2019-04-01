class InvalidCodonError < StandardError
end

class Translation

  RNA = {
    ['AUG'] => 'Methionine', ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine', ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine', ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan', ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    RNA.each do |key, value|
      return value if key.include? codon
    end
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    translation = []
    strand.split(/(...)/).select{ |n| n.size == 3 }.each do |codon|
      translation << of_codon(codon)
      return translation[0..-2] if translation[-1] == 'STOP'
    end
    translation
  end
end
