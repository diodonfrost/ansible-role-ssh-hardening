# Bacula-client install check

control 'install-01' do
  impact 1.0
  title 'Openssh-server package'
  desc 'Openssh-server should be installed'
  describe package('openssh-server') do
    it { should be_installed }
  end
end
