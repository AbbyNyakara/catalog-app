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
