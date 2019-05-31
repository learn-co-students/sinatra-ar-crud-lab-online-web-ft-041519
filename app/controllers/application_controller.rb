
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Start page"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @articles = [Article.find(params[:id])]
    erb :index
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    redirect to "articles/#{article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post 'articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
  end

end
