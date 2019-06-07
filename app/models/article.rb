#Placeholder for a model

class Article < ActiveRecord::Base

  @@all = []

  attr_accessor :title, :content, :id



  def self.create(hash)
    article = Article.new
    article.title = hash[:title]
    article.content = hash[:content]
    #article.id = Article.maximum(:id).next
    @@all << article
    article.save
    article
  end

  def self.all
    @@all
  end

end
