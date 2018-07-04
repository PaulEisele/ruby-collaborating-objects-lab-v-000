class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.class.all << self
  end

  #def name(name)
  #  @name = name
#  end

  def add_song(song)
    @songs << song
    song.artist = self if song.artist != self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    if self.artist.nil?
      self.artist =Artist.new(name)
    else
      self.artist.name = name
    end
  end

  def print_songs
    @@all.each {|songs| puts songs.name}
  end
end
