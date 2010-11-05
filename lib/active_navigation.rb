require 'active_support'

require 'active_navigation/helpers'
require 'active_navigation/nav_menu_class'

ActionView::Base.send :include, ActiveNavigation::Helpers

ActionController::Base.class_eval do
  append_view_path File.join(File.dirname(__FILE__), '..', 'app', 'views')
end

