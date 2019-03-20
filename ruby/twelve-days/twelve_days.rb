module TwelveDays


  DAYS = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  ITEMS = ["twelve Drummers Drumming", "eleven Pipers Piping", "ten Lords-a-Leaping",
    "nine Ladies Dancing", "eight Maids-a-Milking", "seven Swans-a-Swimming",
    "six Geese-a-Laying", "five Gold Rings", "four Calling Birds", "three French Hens",
    "two Turtle Doves", "a Partridge in a Pear Tree"]

  def self.items(d)
    *all, last = ITEMS.drop(11-d)
    all.empty? ? last : (all + ["and #{last}"]).join(", ")
  end

  def self.song
    12.times.map {|d| "On the #{DAYS[d]} day of Christmas my true love gave to me: #{items(d)}.\n"}.join("\n")
  end
end
