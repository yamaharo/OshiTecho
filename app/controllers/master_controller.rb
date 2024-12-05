class MasterController < ApplicationController
  def index
    @hidden_columns = [ "deleted_flg", "created_at", "created_user", "updated_at", "updated_user" ]
    @access_categories=AccessCategory.all
    @access_categories_columns=AccessCategory.column_names
    @access_categories_new=AccessCategory.new
    @affiliations=Affiliation.all
    @affiliations_columns=Affiliation.column_names
    @affiliations_new=Affiliation.new
  end

  def show
  end

  def new
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html { redirect_to @post }  # 通常のHTMLリクエスト用
        format.js   # 非同期リクエスト用に create.js.erb を探して返す
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js   # エラーハンドリングの場合にも create.js.erb を返す
      end
    end
  end

  def insert
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
