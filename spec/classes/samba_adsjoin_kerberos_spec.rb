require 'spec_helper'
 
describe 'samba::adsjoin::kerberos', :type => 'class' do
    
  context "Should execute net ads join -k" do
    it do
      should contain_exec('net ads join -k').with(
        'environment' => [ "LOGNAME=root" ],
        'unless'      => "net ads testjoin -k",
        )
    end

  end
end
