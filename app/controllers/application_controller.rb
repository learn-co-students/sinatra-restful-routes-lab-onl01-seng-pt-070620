class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #action should render a for to create
  #a recipe 
  get '/recipes' do 
    @recipes = Recipe.all 
    erb :index 

  end 

  get '/recipes/new' do 
    erb :new 
  end 

  post '/recipes' do 
    @recipe = Recipe.create(params)
    
    redirect to "/recipes/#{@recipe.id}"
    # @recipe = Recipe.create()
  end 

  get "/recipes/:id" do 

    @recipe = Recipe.find_by_id(params[:id])
    erb :show  # code actions here!
  end 

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit 
  end 

  patch '/recipes/:id' do 

    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.count_time = params[:count_time]
    @recipe.save
    
    redirect to "/recipes/#{@recipe.id}"
  end 

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy

    redirect to '/recipes'

  end 
end
