require 'rubygems' # disable this for a deployed application
require 'hotcocoa'  
 
# Load Windows     
Dir.glob("lib/windows/*.rb").each do |file|
  require file
end    

class Demo
  include HotCocoa

  def start          
    application name: 'Demo' do |app| 
      app.delegate = self      
      # Ideally you'd make sure to close these windows together. 
      TopWin.new   
      BottomWin.new
      CenterWin.new
    end
  end   
end

Demo.new.start