# Uncomment this if you reference any of your controllers in activate
require_dependency 'application'

class HelpExtension < Radiant::Extension
  version "1.0"
  description "Help Documentation for Radiant CMS"
  url "http://saturnflyer.com/"
  
  define_routes do |map|
    map.with_options :controller => 'admin/help' do |help|
      help.help 'admin/help', :action => 'index', :conditions => {:method => :get}
      help.connect 'admin/help/:extension_name', :action => 'show', :conditions => {:method => :get}
    end
  end
  
  def activate
    admin.tabs.add "Help", "/admin/help", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Help"
  end
  
end