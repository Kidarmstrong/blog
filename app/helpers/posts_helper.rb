module PostsHelper
  def get_months
    months = Post.all.group_by { |t| t.created_at.beginning_of_month }  
    months.keys
  end

  def starred_posts
    Post.starred.first(5)
  end
end
