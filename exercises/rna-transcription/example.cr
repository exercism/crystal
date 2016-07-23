class RnaComplement
  def self.of_dna(strand : String)
    strand.tr("CGTA", "GCAU")
  end
end
