class PostDecorator
  def self.build_collection(posts)
    posts.map {|post| new(post)}
  end

  def initialize(post)
    @post = post
  end

  def publication_date
    @post.created_at.strftime("%b %d %Y")
  end
  
  def method_missing(method_name, *args, &block)
    @post.send(method_name,*args,&block)
  end

  def respond_to_missng?(method_name,include_private=false)
    @post.respond_to_missing?(method_name,include_private) || super
  end
end

    
