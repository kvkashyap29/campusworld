class Comment < ActiveRecord::Base
  def create
  Comment.create(allowed_params)
  end
def allowed_params
  params.require(:comment).permit(:article_id, :content)
end  
  belongs_to :article
end
