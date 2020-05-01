class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    
    def index
        @articles = Article.all
    end
    
    def show
        @article = get_article_by_id
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        @article = get_article_by_id
    end
    
    def create
        @article = Article.new(article_params)
    
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def update
        @article = get_article_by_id
    
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = get_article_by_id
        @article.destroy
    
        redirect_to articles_path
    end
    
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

    private
        def get_article_by_id
            Article.find(params[:id])
        end

end