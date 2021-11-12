require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])
    end
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  
    result = connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url", [url, title])
    Bookmark.new(id: result[0]['id'],title: result[0]['title'], url: result[0]['url'])
  end

end