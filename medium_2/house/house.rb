class House

  def self.recite
    new.recite
  end

  def recite
    output = "This is " + pieces[-1][0] + ".\n\n"
    (-2).downto(-pieces.size) do |current_verse|
      output += "This is " + pieces[current_verse][0] + "\n"
      (current_verse).upto(-2) do |verse|
        if verse == -2
          output += pieces[verse][1] + " " + pieces[verse+1][0] + ".\n"
        else
          output += pieces[verse][1] + " " + pieces[verse+1][0] + "\n"
        end
      end
      output += "\n" unless current_verse == -pieces.size
    end
    output
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

puts House.recite
