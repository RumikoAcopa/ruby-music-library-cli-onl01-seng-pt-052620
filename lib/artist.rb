

class Artist
    extend Concerns::Findable
    attr_accessor :name, :song, :genre
    @@all = []
    def initialize(name)
        @name = name
         @song = []
        # @@all << self
    end

    def self.all 
        @@all
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        else
            nil
        end 
        @song << song
    end
    
    def songs 
        @song
        Song.all.select {|song| song.artist == self}
    end

    def self.destroy_all
        @@all.clear 
    end

    def save
        @@all << self
    end

    def self.create(created_artist)
        created_artist = self.new(created_artist)
        created_artist.save
        created_artist
    end

    def genres   
       songs.map {|song| song.genre}.uniq
       
    end

end
