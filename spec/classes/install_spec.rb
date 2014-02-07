require 'spec_helper'

describe 'sysstat', :type => :class do
  describe 'sysstat::install on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    context 'with no parameters' do
      it { should contain_package('sysstat') }
    end

    context 'with parameters' do
      let(:params) {{
        :package_name => 'foo',
        :package_ensure => '1.2.3-1'
      }}

      it { should contain_package('foo').with({
        'ensure' => '1.2.3-1',
        })
      }
    end
  end
end
