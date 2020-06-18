module Slugifiable

    module InstanceMethods 
  
      def slug
        name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
      end 
  
    end 
  
    module ClassMethods
  
      def find_by_slug(slug)
        self.all.find {|name| name.slug == slug }
      end
      
    end
     
  end 