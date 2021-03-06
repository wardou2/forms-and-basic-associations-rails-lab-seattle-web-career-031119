class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
     self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)

    notes.each do |note|
      if !note.empty?
        note = Note.create(content: note)
        self.notes << note
      end
    end

  end

  def note_contents
    notes = self.notes
    notes.collect {|note| note.content}
  end
end
