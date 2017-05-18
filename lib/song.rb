require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(*name)
    @name == name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
     new_song = Song.new
     @@all << new_song
     new_song
  end

  def self.new_by_name(name)
     new_song = Song.new(name)
     new_song.name = name
     new_song
  end

  def self.create_by_name(name)
     new_song = Song.new(name)
     @@all << new_song
     new_song.name = name
     new_song
  end

  def self.find_by_name(name)
     @@all.each do |song_name|
       if name == song_name.name
         return song_name
       end
     end
  end

  def self.find_or_create_by_name(name)
     if !@@all.include?(name)
       self.create_by_name(name)
     end
  end

  def self.alphabetical
      @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
      file_split = file_name.split('.')
      file_split2 = file_split[0].split(" - ")

      song_name = file_split2[1]
      artist = file_split2[0]

      new_song = self.create_by_name(song_name)
      new_song.artist_name = artist
      new_song
  end

  def self.create_from_filename(file_name)
      file_split = file_name.split('.')
      file_split2 = file_split[0].split(" - ")

      song_name = file_split2[1]
      artist = file_split2[0]

      new_song = self.create_by_name(song_name)
      @@all << new_song
      new_song.artist_name = artist
      new_song
   end

   def self.destroy_all
     @@all.clear 
   end

end
