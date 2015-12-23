require 'spec_helper'
 
describe 'samba', :type => 'class' do
    
  context "Should install package, config files and run samba service" do
    it do
      should contain_class('samba::package').that_comes_before("Class[samba::config]")
      should contain_class('samba::config').that_comes_before("Class[samba::service]")
      should contain_class('samba::service').that_comes_before("Class[samba]")
    end

  end
end
