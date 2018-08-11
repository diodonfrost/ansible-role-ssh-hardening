# Openssh hardening check

control 'install-01' do
  impact 1.0
  title 'Openssh folder'
  desc 'Openssh-server should be owned by root'
  describe file('/etc/ssh') do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
  end
end

control 'install-02' do
  impact 1.0
  title 'Protocol ssh version'
  desc 'Protocol ssh allow should be only 2'
  describe sshd_config do
    its('Protocol') { should cmp 2 }
  end
end

control 'install-03' do
  impact 1.0
  title 'Root login not allow'
  desc 'Root login should be disable'
  describe sshd_config do
    its('PermitRootLogin') { should cmp 'no'}
  end
end
