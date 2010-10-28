require 'active_navigation/helpers'
require 'active_navigation/nav_menu_class'

class ActionView::Base
  include ActiveNavigation::ClassMethods
end

