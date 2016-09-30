require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all.last
  end

  def self.new_by_name(name)
    @@all << Song.new
    @@all.last.name = name
    @@all.last
  end

  def self.create_by_name(name)
    @@all << Song.new
    @@all.last.name = name
    @@all.last
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)==nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    Song.new_by_name(name)
    Song.find_by_name(name).artist_name=(artist)
    Song.find_by_name(name)
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1].split(".")[0]
    Song.new_by_name(name)
    Song.find_by_name(name).artist_name=(artist)
    Song.find_by_name(name)
  end

  def self.destroy_all
    @@all.clear
  end

end
