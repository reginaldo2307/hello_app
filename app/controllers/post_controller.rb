class PostsController <ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        $post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |f|
            if (@post.save)
                f.html { redirec_to "", notice: "Post criado"}
            else
                f.html { redirec_to "", notice: "Ocorreu um erro ao salvar o post"}
            end
        end
    end
    
    private
    def post_params 
        params.require(:post).permit(:user_id, :content)
        
    end
end