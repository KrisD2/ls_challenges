class DNA

  def initialize(test_strand)
    @test_strand = test_strand
  end

  def hamming_distance(strand)
    test_length = [strand.size, @test_strand.size].min
    hamming_distance = 0
    0.upto(test_length - 1) do |index|
      hamming_distance += 1 if @test_strand[index] != strand[index]
    end
    hamming_distance
  end
end
