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
  title 'Openssh folder'
  desc 'Openssh-server should be owned by root'
  describe file('/etc/ssh') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
  end
end

control 'install-03' do
  impact 1.0
  title 'Openssh-server config'
  desc 'Openssh-server config'
  describe sshd_config do
    its('Protocol') { should cmp 2 }
    its('PermitRootLogin') { should cmp 'no'}
    its('UsePAM') { should eq 'yes' }
  end
end
