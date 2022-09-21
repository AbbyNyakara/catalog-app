require 'json'

def save_book(book)
  JSON.dump(book, File.open('./storage/books.json', 'w+'))
end

def save_movie(movie)
  JSON.dump(movie, File.open('./storage/movies.json', 'w+'))
end

def save_album(album)
  JSON.dump(album, File.open('./storage/albums.json', 'w+'))
end

def save_game(game)
  JSON.dump(game, File.open('./storage/games.json', 'w+'))
end

def save_author(author)
  JSON.dump(author, File.open('./storage/authors.json', 'w+'))
end

def save_genre(genre)
  JSON.dump(genre, File.open('./storage/genre.json', 'w+'))
end

def save_labels(label)
  JSON.dump(label, File.open('./storage/label.json', 'w+'))
end

def save_source(source)
  JSON.dump(source, File.open('./storage/source.json', 'w+'))
end

def retrieve_books(books)
  data = JSON.parse(File.read('./storage/books.json'))
  data.each do |book|
    books << Book.new(book['publisher'], book['cover_state'], book['date'])
  end
rescue Errno::ENOENT
  puts 'No book yet!'
end

def retrieve_movies(movies)
  data = JSON.parse(File.read('./storage/movies.json'))
  data.each do |movie|
    movies << Movie.new(movie['publish_date'], movie['silent'])
  end
rescue Errno::ENOENT
  puts 'No movie yet!'
end

def retrieve_albums(music_albums)
  data = JSON.parse(File.read('./storage/albums.json'))
  data.each do |album|
    music_albums << MusicAlbum.new(album['on_spotify'], album['publish_date'])
  end
rescue Errno::ENOENT
  puts 'No music album yet!'
end

def retrieve_games(games)
  data = JSON.parse(File.read('./storage/games.json'))
  data.each do |game|
    games << Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
  end
rescue Errno::ENOENT
  puts 'No game yet!'
end

def retrieve_genres(genres)
  data = JSON.parse(File.read('./storage/genre.json'))
  data.each do |genre|
    genres << Genre.new(genre['name'])
  end
rescue Errno::ENOENT
  puts 'No genre yet!'
end

def retrieve_authors(authors)
  data = JSON.parse(File.read('./storage/authors.json'))
  data.each do |author|
    authors << Author.new(author['first_name'], author['last_name'])
  end
rescue Errno::ENOENT
  puts 'No author yet!'
end

def retrieve_sources(sources)
  data = JSON.parse(File.read('./storage/source.json'))
  data.each do |source|
    sources << Source.new(source['name'])
  end
rescue Errno::ENOENT
  puts 'No sources yet!'
end

def retrieve_labels(labels)
  data = JSON.parse(File.read('./storage/label.json'))
  data.each do |label|
    labels << Label.new(label['title'], label['color'])
  end
rescue Errno::ENOENT
  puts 'No sources yet!'
end

def save_data(item)
  save_book(item.books)
  save_movie(item.movies)
  save_album(item.music_albums)
  save_game(item.games)
  save_author(item.authors)
  save_genre(item.genres)
  save_labels(item.labels)
  save_source(item.sources)
end

def retrieve_data(item)
  retrieve_books(item.books)
  retrieve_movies(item.movies)
  retrieve_albums(item.music_albums)
  retrieve_games(item.games)
  retrieve_labels(item.labels)
  retrieve_genres(item.genres)
  retrieve_authors(item.authors)
  retrieve_sources(item.sources)
end
