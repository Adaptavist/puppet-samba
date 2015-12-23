require 'spec_helper'
 
describe 'samba::package', :type => 'class' do
    
  context "Should install package" do
    let(:params){{
        'package'=>"samba", 
        'absent'=>false,
        }}
    
    it do
      should contain_package('samba').with_ensure('present').with_name("samba")
    end

  end
end
