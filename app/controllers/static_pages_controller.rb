class StaticPagesController < ApplicationController
  skip_before_filter :authenticate

  def about

  end

  def ask_me

  end
end
