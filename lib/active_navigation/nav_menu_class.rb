require 'ostruct'

module ActiveNavigation

  module NavMenuClass

    class NavMenu < Struct.new(:items, :options)
    
      def initialize(*args)
        self.items = []
        self.options = menu_default_options.merge(args.extract_options!)
      end
      
      def add(title, path = nil, *args)
        new_options = menu_item_default_options(title, path).merge(args.extract_options!)
        self.items << NavMenuItem.new(new_options)
      end
      
      def set_options(*new_options)
        self.options.merge!(new_options.extract_options!) if new_options
      end
      
    class NavMenuItem < OpenStruct; end

    private

      def menu_default_options
        {
          :class => "nav", 
          :class_for_active => "active", 
          :items_classify => false 
        }
      end
      
      def menu_item_default_options(title, path)
        { :title => title, :path => path }
      end
      
    end

  end

end

