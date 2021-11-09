require 'bookmark'

describe Bookmark do

  describe '.all' do

    # it 'updates the #all class method' do
    # connection = PG.connect(dbname: 'bookmark_manager')
    # result = connection.exec('SELECT * FROM bookmarks')

    # expect(bookmarks).to include("http://www.makersacademy.com")
    # end

    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end

  end

end