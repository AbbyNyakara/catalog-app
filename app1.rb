require './game'
require './movie'
require './music'
require './book'
require './author'
require './genre'
require './source'
require './label'
require './data1'

class Interface
  attr_accessor :genres, :sources, :labels, :authors, :books, :movies,
                :music_albums, :games

  def initialize
    self.genres = []
    self.sources = []
    self.labels = []
    self.authors = []
    self.books = []
    self.movies = []
    self.music_albums = []
    self.games = []
    @exit = false
  end

  # rubocop:disable Metrics/MethodLength
  def add_book
    print 'Enter the title of the book: '
    title = gets.chomp
    print 'Enter the color of the book: '
    color = gets.chomp
    print 'Enter the authors first name: '
    first_name = gets.chomp
    print 'Enter the authors last name: '
    last_name = gets.chomp
    print 'Enter the genre of the book: '
    genre = gets.chomp
    print 'Enter the source of the book: '
    source = gets.chomp
    print 'Enter the publisher of the book: '
    publisher = gets.chomp
    print 'Enter the cover state of the book(string): '
    cover = gets.chomp
    print 'Enter the date the book was published: '
    date = gets.chomp

    books << Book.new(publisher, cover, date)
    authors << Author.new(first_name, last_name)
    genres << Genre.new(genre)
    sources << Source.new(source)
    labels << Label.new(title, color)
    puts "Book created successfully\n \n"
  end
  # rubocop:enable Metrics/MethodLength

  def list_books
    @books.each do |book|
      p book.to_s
    end
  end

  def add_game
    print 'Enter the multiplayer: '
    multiplayer = gets.chomp
    print 'Enter the date it was last played: '
    last_played = gets.chomp
    print 'Give the publish date of the game: '
    publish_date = gets.chomp
    print 'Give the source name: '
    source_name = gets.chomp
    puts "Game created successfully\n \n"

    games << Game.new(multiplayer, last_played, publish_date)
    sources << Source.new(source_name)
  end

  def add_movie
    print 'Enter the publish date of the movie: '
    publish_date = gets.chomp
    print 'Enter if silet or not [Y/n]: '
    silent_choice = gets.chomp
    silent = true if %w[Y y].include?(silent_choice)
    silent = false if %w[N n].include?(silent_choice)
    print 'Select the genre of the movie: '
    genre = gets.chomp
    print 'Give the source of the movie: '
    source = gets.chomp
    puts "Movie created successfully\n \n"

    movies << Movie.new(publish_date, silent)
    genres << Genre.new(genre)
    sources << Source.new(source)
  end

  def add_music_album
    print 'Declare if on spotify or not [Y/n]: '
    spotify_choice = gets.chomp
    on_spotify = true if %w[Y y].include?(spotify_choice)
    on_spotify = false if %w[N n].include?(spotify_choice)
    print 'Enter the date the album was published: '
    publish_date = gets.chomp
    print 'What is the source of the album: '
    source = gets.chomp
    print 'What is the label title the album is under: '
    label_title = gets.chomp
    print 'Label studio: '
    studio = gets.chomp
    print 'select the genre of the genre of the album: '
    genre = gets.chomp
    puts "Music album created successfully\n \n"

    music_albums << MusicAlbum.new(on_spotify, publish_date)
    sources << Source.new(source)
    labels << Label.new(label_title, studio)
    genres << Genre.new(genre)
  end

  def dispaly_options
    options = %w[
      add_book
      add_game
      add_movie
      add_album
      list_books
      exit
    ]

    options.each_with_index do |option, ind|
      puts "#{ind + 1} : #{option}"
    end
  end

  def leave
    @exit = true
  end

  def execute(choice)
    return add_book if choice == 1
    return add_game if choice == 2
    return add_movie if choice == 3
    return add_music_album if choice == 4
    return list_books if choice == 5
    return leave if choice == 6

    p 'Invalid choice'
  end

  def final
    while @exit == false
      dispaly_options
      execute(gets.chomp.to_i)
    end
    save_data(self)
  end
end

mimi = Interface.new
mimi.final
