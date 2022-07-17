scales = {'a' => {'A'=> 1,'A#'=> 2,'H'=> 3,'C'=> 4,'C#'=> 5,'D'=> 6,'D#'=> 7,'E'=> 8,'F'=> 9,'F#'=> 10,'G'=> 11,'G#'=>12},
'bb' => {'Bb'=> 1, 'H'=> 2, 'C'=> 3, 'Db'=> 4, 'D' => 5, 'Eb' => 6, 'E' => 7, 'F'=> 8, 'Gb'=> 9, 'G'=> 10, 'Ab'=> 11, 'A'=> 12},
'h' => {'H'=> 1, 'C'=> 2, 'C#'=> 3, 'D'=> 4, 'D#'=> 5, 'E'=> 6, 'F'=> 7, 'F#'=> 8, 'G'=> 9, 'G#'=> 10, 'A'=> 11, 'A#'=> 12},
'c' => {'C'=> 1, 'C#'=> 2, 'D'=> 3, 'D#'=> 4, 'E'=> 5, 'F'=> 6, 'F#'=> 7, 'G'=> 8, 'G#'=> 9, 'A'=> 10, 'A#'=> 11, 'H'=> 12},
'c#' => {'C#'=> 1, 'D'=> 2, 'D#'=> 3, 'E'=> 4, 'F'=> 5, 'F#'=> 6, 'G'=> 7, 'G#'=> 8, 'A'=> 9, 'A#'=> 10, 'H'=> 11, 'C'=> 12},
'd' => {'D'=> 1, 'D#'=> 2, 'E'=> 3, 'F'=> 4, 'F#'=> 5, 'G'=> 6, 'G#'=> 7, 'A'=> 8, 'A#'=> 9, 'H'=> 10, 'C'=> 11, 'C#'=> 12},
'd#' => {'D#'=> 1, 'E'=> 2, 'F'=> 3, 'F#'=> 4, 'G'=> 5, 'G#'=> 6, 'A'=> 7, 'A#'=> 8, 'H'=> 9, 'C'=> 10, 'C#'=> 11, 'D'=> 12},
'e' => {'E'=> 1, 'F'=> 2, 'F#'=> 3, 'G'=> 4, 'G#'=> 5, 'A'=> 6, 'A#'=> 7, 'H'=> 8, 'C'=> 9, 'C#'=> 10, 'D'=> 11, 'D#'=> 12},
'f' => {'F'=> 1, 'F#'=> 2, 'G'=> 3, 'G#'=> 4, 'A'=> 5, 'A#'=> 6, 'H'=> 7, 'C'=> 8, 'C#'=> 9, 'D'=> 10, 'D#'=> 11, 'E'=> 12},
'f#' => {'F#'=> 1, 'G'=> 2, 'G#'=> 3, 'A'=> 4, 'A#'=> 5, 'H'=> 6, 'C'=> 7, 'C#'=> 8, 'D'=> 9, 'D#'=> 10, 'E'=> 11, 'F'=> 12},
'g' => {'G'=> 1, 'G#'=> 2, 'A'=> 3, 'A#'=> 4, 'H'=> 5, 'C'=> 6, 'C#'=> 7, 'D'=> 8, 'D#'=> 9, 'E'=> 10, 'F'=> 11, 'F#'=> 12},
'g#' => {'G#'=> 1, 'A'=> 2, 'A#'=> 3, 'H'=> 4, 'C'=> 5, 'C#'=> 6, 'D'=> 7, 'D#'=> 8, 'E'=> 9, 'F'=> 10, 'F#'=> 11, 'G'=> 12}}

puts "\nWelcome to Transposer, a simple program that allows you to transpose chords from one key to another"
puts "Enter original key: "
orig_key = 'am' #gets.chomp.downcase

puts "Enter new key: "
new_key = 'dm' #gets.chomp.downcase

puts "Enter chord sequence: "
orig_chords = 'Am7 D#m7 Dm9 E7 A#m7 Am7'.split(' ') #gets.chomp.split(' ')

orig_first_letters = []
orig_remaining_letters = []
orig_chords.each {|letter|
  (letter[1] == '#' ? orig_first_letters << letter[0].upcase + letter[1] : orig_first_letters << letter[0].upcase)
  (letter[1] == '#' ? orig_remaining_letters << letter[2..] : orig_remaining_letters << letter[1..])
  (letter[1] == 'b' ? orig_first_letters << letter[0].upcase + letter[1] : orig_first_letters << letter[0].upcase)
  (letter[1] == 'b' ? orig_remaining_letters << letter[2..] : orig_remaining_letters << letter[1..])
}
puts 'orig_first_letters'
orig_first_letters.each {|l| print(l, ' ')}
puts 'orig_remaining_letters'
orig_remaining_letters.each {|l| print(l, ' ')}
steps = []
orig_first_letters.each {|letter|
  steps << scales[(orig_key[1] == '#' or orig_key[1] == 'b' ? orig_key[0].downcase + orig_key[1] : orig_key[0])][letter]
}
puts 'steps'
steps.each {|l| print(l, ' ')}
new_first_letters = []
steps.each {|step|
  new_first_letters << scales[(new_key[1] == '#' or new_key[1] == 'b' ? new_key[0].downcase + new_key[1] : new_key[0])].key(step)
}
puts 'new_first_letters'
new_first_letters.each {|l| print(l, ' ')}
new_first_and_remaining_letters = []
for i in [0..new_first_letters.size] do
  new_first_and_remaining_letters[i] = new_first_letters[i] + orig_remaining_letters[i]
end
puts 'new_first_and_remaining_letters'
new_first_and_remaining_letters.each {|l| print(l, ' ')}
puts "Chords in #{new_key[0].upcase + new_key[1..]} "

first_letter_index = 0
remaining_letter_index = new_first_letters.size
while first_letter_index < new_first_letters.size do
  print "#{new_first_and_remaining_letters[first_letter_index] + new_first_and_remaining_letters[remaining_letter_index] + ' '}"
  first_letter_index += 1
  remaining_letter_index += 1
end

