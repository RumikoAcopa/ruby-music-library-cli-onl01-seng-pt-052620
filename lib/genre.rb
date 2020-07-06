class Genre
    extend Concerns::Findable
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear 
    end

    def save
        @@all << self
    end

    def self.create(created_genre)
        Genre.new(created_genre)
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end

    def artists
        songs.map {|song| song.artist}.uniq
    end
end
