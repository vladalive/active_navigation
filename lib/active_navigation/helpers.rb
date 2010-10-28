module ActiveNavigation
  module ClassMethods
    
    def active_navigation(menu)
      render :partial => "navigation/active_navigation", :locals => { :menu => menu }
    end
    
    def active_nav_menu(*args)
      ActiveNavigation::NavMenuClass::NavMenu.new(*args)
    end
    
    def nav_active(menu, *args)
      default_options = { :class => "nav", :class_for_active => "active", :items_classify => false }
      options = args.extract_options!.reverse_merge!(default_options)
      render :partial => "navigation/nav_active", :locals => { :menu => menu, :options => options}
    end
    
  end

  module InstanceMethods
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

end

