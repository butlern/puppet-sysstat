require 'spec_helper'

describe 'sysstat', :type => :class do
  describe 'sysstat::config on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    context 'with no parameters' do
      it { should contain_file('/etc/cron.d/sysstat') }
      it { should contain_file('/etc/cron.daily/sysstat') }
      it { should contain_file_line('/etc/default/sysstat-enable').with({
          'line' => 'ENABLED="true"',
        })
      }
      it { should contain_file_line('/etc/default/sysstat-sa1_options').with({
          'line' => 'SA1_OPTIONS="-S DISK"',
        })
      }
      it { should contain_file_line('/etc/default/sysstat-sa2_options').with({
          'line' => 'SA2_OPTIONS=""',
        })
      }
      it { should contain_file_line('/etc/sysstat/sysstat-history').with({
          'line' => 'HISTORY=7',
        })
      }
      it { should contain_file_line('/etc/sysstat/sysstat-compress').with({
          'line' => 'COMPRESSAFTER=10',
        })
      }
    end

    context 'with parameters' do
      let(:params) {{
        'config' => '/tmp/sysstat/sysstat',
        'defaults' => '/tmp/default/sysstat',
        'sa1_cronfile' => '/tmp/cron.d/sysstat',
        'sa2_cronfile' => '/tmp/cron.daily/sysstat',
        'service_enable' => false,
        'sa1_options' => '-S ALL',
        'sa2_options' => '-A',
        'history' => '10',
        'compress' => '5',
      }}

      it { should contain_file('/tmp/cron.d/sysstat') }
      it { should contain_file('/tmp/cron.daily/sysstat') }
      it { should contain_file_line('/tmp/default/sysstat-enable').with({
          'line' => 'ENABLED="false"',
        })
      }
      it { should contain_file_line('/tmp/default/sysstat-sa1_options').with({
          'line' => 'SA1_OPTIONS="-S ALL"',
        })
      }
      it { should contain_file_line('/tmp/default/sysstat-sa2_options').with({
          'line' => 'SA2_OPTIONS="-A"',
        })
      }
      it { should contain_file_line('/tmp/sysstat/sysstat-history').with({
          'line' => 'HISTORY=10',
        })
      }
      it { should contain_file_line('/tmp/sysstat/sysstat-compress').with({
          'line' => 'COMPRESSAFTER=5',
        })
      }
    end
  end
end
