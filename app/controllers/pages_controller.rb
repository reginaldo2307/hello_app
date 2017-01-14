# O controlador de páginas contém todo o código para qualquer página dentro de /páginas
class PagesController < ApplicationController
  
  #código back-end da pagina index
  def index
  end
  #código back-end da pagina home
  def home
    @posts = Post.all
  end
  #código back-end da pagina profile
  def profile
    # Pegue a url do usuário através do id
  if (User.find_by_username(params[:id]))
    @username = params[:id]
  else
    redirect_to root_path, :notice=> "Usuário nã encontrado"
  end
  
  @posts = Post.all.where("user_id = ?", user.find_by_username(params[:id]).id)
  @newPost = Post.new
end

  #código back-end da pagina explore
  def explore
    @posts = Post.all
  end
end
