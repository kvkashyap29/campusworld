class Post < ActiveRecord::Base
 def create
  Post.create(allowed_params)
  end
def allowed_params
  params.require(:post).permit(:name, :content,:published_at)
end  
  has_many :comments
  
  searchable do
    text :name, :boost => 5
    text :content, :publish_month
    text :comments do
      comments.map(&:content)
    end
    time :published_at
    string :publish_month
  end
  
  def publish_month
    published_at.try(:strftime, ("%B %Y"))
  end
end