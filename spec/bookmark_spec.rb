require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all the bookmarks' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'www.gov.org.uk', title: 'Gov')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.url).to eq 'www.gov.org.uk'
      expect(bookmark.title).to eq 'Gov'
    end
  end

  describe '.delete' do
    it 'deletes an existing bookmark' do
      bookmark = Bookmark.create(title: 'Gov', url:'www.gov.org.uk')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates an existing bookmark' do
      bookmark = Bookmark.create(url: 'www.gov.org.uk', title: 'Gov')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'www.example.com', title: 'Example')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Example'
      expect(updated_bookmark.url).to eq 'www.example.com'
    end
  end

  describe '.find' do
    it 'returns the request bookmark object' do
      bookmark = Bookmark.create(title: 'Gov', url: 'www.gov.org.uk')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Gov'
      expect(result.url).to eq 'www.gov.org.uk'
    end
  end
end
