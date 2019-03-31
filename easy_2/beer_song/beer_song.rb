class BeerSong
  def verses(start, downto)
    verse = start
    song = []
    until verse < downto
      if verse == 1
        verse -= 1
        song << "#{verse+1} bottle of beer on the wall, " +
        "#{verse+1} bottle of beer.\n" +
        "Take it down and pass it around, " +
        "no more bottles of beer on the wall.\n"
      elsif verse == 2
        verse -= 1
        song << "#{verse+1} bottles of beer on the wall, " +
        "#{verse+1} bottles of beer.\n" +
        "Take one down and pass it around, " +
        "#{verse} bottle of beer on the wall.\n"
      elsif verse == 0
        verse -= 1
        song << "No more bottles of beer on the wall, " +
        "no more bottles of beer.\n" +
        "Go to the store and buy some more, " +
        "99 bottles of beer on the wall.\n"
      else
        verse -= 1
        song << "#{verse+1} bottles of beer on the wall, " +
        "#{verse+1} bottles of beer.\n" +
        "Take one down and pass it around, " +
        "#{verse} bottles of beer on the wall.\n"
      end
    end
    song.join("\n")
  end

  def verse(start)
    verses(start, downto = start)
  end

  def lyrics
    verses(99, 0)
  end
end
