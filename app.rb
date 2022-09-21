require './book'
require './music'
require './movie'
require 'json'

class App
  def list_sources
    all_sources = []
    File.open('./data/source.json', 'r') do |file|
      s1 = JSON.parse(file.read)
      s1.each { |source| all_sources << source }
    end

    all_sources.each_with_index {|s, i| print "(#{i}) #{s["Source"]} \n"}
  end

  def add_book
    all_books = []
    File.open('./data/book.json', 'r') do |file|
      b1 = JSON.parse(file.read)
      b1.each { |book| all_books << book }
    end

    puts "Publisher: "
    publisher = gets.chomp
    puts "Cover state: "
    cover_state = gets.chomp
    puts "Publish date: "
    publish_date = gets.chomp

    new_book = Book.new(publisher, cover_state, publish_date)
    
    File.open('./data/book.json', 'w+') do |file|
      all_books << {Publisher: new_book.publisher, Cover_state: new_book.cover_state, Publish_date: new_book.publish_date}
      ss = JSON.dump(all_books)
      file.write(ss)
    end
  end


  def add_music_album
    all_music = []
    File.open('./data/music.json', 'r') do |file|
      m1 = JSON.parse(file.read)
      m1.each { |element| all_music << element }
    end

    puts "Is it on Spotify? (1)Yes (2)No "
    on_spotify = gets.chomp
    puts "Publish date: "
    publish_date = gets.chomp

    if on_spotify == "1"
      on_spotify = true
    elsif on_spotify == "2" 
      on_spotify = false
    end

    new_music = MusicAlbum.new(on_spotify, publish_date)
    
    File.open('./data/music.json', 'w+') do |file|
      all_music << { On_spotify: new_music.on_spotify, Publish_date: new_music.publish_date}
      ss = JSON.dump(all_music)
      file.write(ss)
    end
  end

  def add_movie
    all_movies = []
    File.open('./data/movie.json', 'r') do |file|
      b1 = JSON.parse(file.read)
      b1.each { |book| all_movies << book }
    end

    puts "Publish date: "
    publish_date = gets.chomp
    puts "Silent or not: "
    silent_choice = gets.chomp
    silent = true if %w[Y y].include?(silent_choice)
    silent = false if %w[N n].include?(silent_choice)

    new_movie = Movie.new(publish_date, silent)
    
    File.open('./data/movie.json', 'w+') do |file|
      all_movies << {Publish_date: new_movie.publish_date, silent: new_movie.silent}
      ss = JSON.dump(all_movies)
      file.write(ss)
    end
  end


end

aa=App.new
aa.add_movie