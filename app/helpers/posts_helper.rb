module PostsHelper

  def post_path(post)
    return "blog/" + post.slug
  end
end
