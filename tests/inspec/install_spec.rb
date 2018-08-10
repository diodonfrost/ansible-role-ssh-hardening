# Bacula-client install check

control 'install-01' do
  impact 1.0
  title 'Openssh-server package'
  desc 'Openssh-server should be installed'
  describe package('openssh-server') do
    it { should be_installed }
  end
end

control 'install-02' do
  impact 1.0
  title 'Openssh-server service'
  desc 'Openssh-server service should be running'
  describe service('sshd') do
    it { should be_running }
    it { should be_enabled }
  end
end
