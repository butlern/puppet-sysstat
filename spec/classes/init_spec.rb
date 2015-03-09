require 'spec_helper'

describe 'sysstat' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "sysstat class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('sysstat::params') }

        it { should contain_class('sysstat::install') }
        it { should contain_class('sysstat::config') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'sysstat class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should raise_error(Puppet::Error, /Nexenta not supported/) }}
    end
  end
end
