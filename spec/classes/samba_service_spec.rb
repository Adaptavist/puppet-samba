require 'spec_helper'
 
describe 'samba::service', :type => 'class' do
    
  context "Should configures service" do
    let(:params){{
        'package' => 'samba', 
        'absent' => false,
        'disable' => false,
        'disableboot' => false,
        'service' => 'samba',
        }}
    
    it do
      should contain_service('samba').with_ensure('running').with_name("samba").with_enable('true')
    end
  end
  context "Should disable service" do
    let(:params){{
        'package' => 'samba', 
        'absent' => true,
        'disable' => true,
        'disableboot' => true,
        'service' => 'samba',
        }}
    
    it do
      should contain_service('samba').with_ensure('stopped').with_name("samba").with_enable('false')
    end
  end
end
