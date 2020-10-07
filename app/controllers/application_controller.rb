class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/' do
    erb :index
  end

   get '/recipes/new' do #loads new form
    erb :new
   end

  get '/recipes' do #loads index page
    @recipes = Recipe.all
    erb :recipes
  end
  


  get '/recipes/:id' do  #loads show page
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  
  post '/recipes' do  #creates a recipe
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end 

  get '/recipes/:id/edit' do #loads edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do  #updates a recipe
  

    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    #@recipe.update(title: params[:title], content: params[:content])
    

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    
    Recipe.destroy(params[:id])
    redirect to '/recipes'
  end

  

  

end
