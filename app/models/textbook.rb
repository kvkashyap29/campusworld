class Textbook < ApplicationRecord
	
	searchable do

      text :name  , :as => :name_textp
      text :name , :stored => true
      text :author, :as => :author_textp
      text :author, :stored => true
      text :publications, :as => :publications_textp
      text :publications, :stored => true
      string :publications
      string :publ
   end
  def publ
  self.publications
  end
  end  
  