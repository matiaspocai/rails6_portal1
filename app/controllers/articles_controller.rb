class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :show]
  before_action :is_admin, except: [:home, :show, :new]
  before_action :find_article, only: [:new, :show]

  def index
      if @isAdmin
        @articles = Article.all.order(id: :desc)
      else
        redirect_to home_path
      end
  end

  def home
    urgente = Article.where(publicado:"si", area:"u")
    @urgente = urgente.last
    articles = Article.where(publicado: "si", area: "n").order(ubicacion: :asc)
    @a1 = articles[0]
    @a2 = articles[1]
    @a3 = articles[2]
    @a4 = articles[3]
    @a5 = articles[4]
    @a6 = articles[5]
    @a7 = articles[6]
    @a8 = articles[7]
    @a9 = articles[8]
    @a10 = articles[9]
    @a11 = articles[10]
    @a12 = articles[11]
  end

  # GET /articles/1.json
  def show
    is_admin
  end

  def new
  end

  def edit
    if @isAdmin
    @article = find_article
    else
      redirect_to home_path
    end
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
        format.html { redirect_to home_path }
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
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:volanta, :titulo, :bajada, :autor, :cuerpo, :ubicacion, :seccion, :publicado, :image, :imagedos, :area)
    end

    def is_admin
      if current_user
        user = current_user
        @isAdmin = user.admin
      end
    end

end
