class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    @author.save
    redirect_to root_path
  end
  #show action
  def show
    @author = Author.find(params[:id])
    #print the whole database of authors
    puts Author.all
    #print the names of all authors
    puts Author.all.map{|author| author.name}
  end
end
