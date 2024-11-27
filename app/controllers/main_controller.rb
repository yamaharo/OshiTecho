class MainController < ApplicationController
  def home
    @access_categories = AccessCategory.all
  end
end
