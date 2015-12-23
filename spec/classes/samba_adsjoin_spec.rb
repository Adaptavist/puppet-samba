require 'spec_helper'
 
describe 'samba::adsjoin', :type => 'class' do
    
  context "Should include samba::adsjoin::kerberos" do
    it do
      should contain_class('samba::adsjoin::kerberos')
    end

  end
end
