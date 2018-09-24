class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # add associations here

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |n|
      note = Note.find_or_create_by(content: n) unless n.blank?
      self.notes << note
    end
  end

  def note_contents
    if self.notes
      self.notes.collect do |n|
        n.content
      end
    end
  end


  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end


end
