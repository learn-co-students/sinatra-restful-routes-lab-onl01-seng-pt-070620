class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end
   
  post '/recipes' do
    @recipes = Recipe.create(params)
    redirect to "/recipes/#{@recipes.id}"
  end

  get '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipes = Recipe.find_by_id(params[:id])
    erb :edit
  end
 
patch '/recipes/:id' do #edit action
  @recipes = Recipe.find_by_id(params[:id])
  @recipes.title = params[:title]
  @recipes.ingredients = params[:ingredients]
  @recipes.cook_time = params[:cook_time]
  @recipes.save
  redirect to "/recipes/#{@recipes.id}"
end

delete '/recipes/:id' do #delete action
  @recipes = Recipe.find_by_id(params[:id])
  @recipes.delete
  redirect to '/recipes'
end


end
