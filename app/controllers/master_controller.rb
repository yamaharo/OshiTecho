class MasterController < ApplicationController
  def index
    set_model
  end

  def show
  end

  def new
    # if @post.save
    #   respond_to do |format|
    #     format.html { redirect_to @post }  # 通常のHTMLリクエスト用
    #     format.js   # 非同期リクエスト用に create.js.erb を探して返す
    #   end
    # else
    set_model
    @item = "Oshi "
    respond_to do |format|
      format.turbo_stream do
        format.turbo_stream
        format.html { redirect_to master_index_path, notice: "Post was successfully created." }
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

  def set_model
    @hidden_columns = [ "deleted_flg", "created_at", "created_user", "updated_at", "updated_user" ]
    @access_categories=AccessCategory.all
    @access_categories_columns=AccessCategory.column_names
    @access_categories_new=AccessCategory.new
    @event_categories=EventCategory.all
    @event_categories_columns=EventCategory.column_names
    @event_categories_new=EventCategory.new
    @musics=Music.all
    @musics_columns=Music.column_names
    @musics_new=Music.new
    @jobs=Job.all
    @jobs_columns=Job.column_names
    @jobs_new=Job.new
  end
end
