require './book'
require './music'
require './movie'
require './game'
require 'json'

class App
  def list_sources
    all_sources = []
    File.open('./data/source.json', 'r') do |file|
      s1 = JSON.parse(file.read)
      s1.each { |source| all_sources << source }
    end

    all_sources.each_with_index { |s, i| print "(#{i}) #{s['Source']} \n" }
  end

  # rubocop: disable Metrics/MethodLength
  def add_book
    all_books = []
    File.open('./data/book.json', 'r') do |file|
      b1 = JSON.parse(file.read)
      b1.each { |book| all_books << book }
    end

    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp

    new_book = Book.new(publisher, cover_state, publish_date)

    File.open('./data/book.json', 'w+') do |file|
      all_books << {
        Publisher: new_book.publisher,
        Cover_state: new_book.cover_state,
        Publish_date: new_book.publish_date
      }
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

    print 'Is it on Spotify? (1)Yes (2)No '
    on_spotify = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp

    case on_spotify
    when '1'
      on_spotify = true
    when '2'
      on_spotify = false
    end

    new_music = MusicAlbum.new(on_spotify, publish_date)

    File.open('./data/music.json', 'w+') do |file|
      all_music << { On_spotify: new_music.on_spotify, Publish_date: new_music.publish_date }
      ss = JSON.dump(all_music)
      file.write(ss)
    end
  end
  # rubocop: enable Metrics/MethodLength

  def add_movie
    all_movies = []
    File.open('./data/movie.json', 'r') do |file|
      b1 = JSON.parse(file.read)
      b1.each { |book| all_movies << book }
    end

    print 'Publish date: '
    publish_date = gets.chomp
    print 'Silent or not: '
    silent_choice = gets.chomp
    silent = true if %w[Y y].include?(silent_choice)
    silent = false if %w[N n].include?(silent_choice)

    new_movie = Movie.new(publish_date, silent)

    File.open('./data/movie.json', 'w+') do |file|
      all_movies << { Publish_date: new_movie.publish_date, silent: new_movie.silent }
      ss = JSON.dump(all_movies)
      file.write(ss)
    end
  end

  # rubocop: disable Metrics/MethodLength
  def add_game
    all_games = []
    File.open('./data/game.json', 'r') do |file|
      b1 = JSON.parse(file.read)
      b1.each { |game| all_games << game }
    end

    print 'Publish date: '
    publish_date = gets.chomp
    print 'Enter multiplayer: '
    multiplayer = gets.chomp
    print 'Last played on date?: '
    last_played_at = gets.chomp

    new_game = Game.new(publish_date, multiplayer, last_played_at)

    File.open('./data/game.json', 'w+') do |file|
      all_games << {
        Publish_date: new_game.publish_date,
        multiplayer: new_game.multiplayer,
        last_played_at: new_game.last_played_at
      }
      ss = JSON.dump(all_games)
      file.write(ss)
    end
  end
  # rubocop: enable Metrics/MethodLength
end

aa = App.new
aa.add_game
