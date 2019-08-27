class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def home
    @articles = Article.where(publicado: "si", area: "n")
    destacados = Article.where(publicado: "si", area: "d")
    @destacado = destacados.last
    urgente = Article.where(publicado:"si", area:"u")
    @urgente = urgente.last
  end

  # GET /articles/1.json
  def show
    @article = find_article
  end

  def new
    @article = Article.new
  end

  def edit
    @article = find_article
  end

  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = find_article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = find_article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_article
      Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:volanta, :titulo, :bajada, :autor, :cuerpo, :ubicacion, :seccion, :publicado, :image, :imagedos, :area)
    end
end
