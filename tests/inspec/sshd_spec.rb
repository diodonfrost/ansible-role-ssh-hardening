title 'Opensh-server test'

control 'sshd-01' do
  impact 1.0
  title 'Protocol ssh version'
  desc 'Protocol ssh allow should be only 2'
  describe sshd_config do
    its('Protocol') { should cmp 2 }
  end
end

control 'sshd-02' do
  impact 1.0
  title 'Root login not allow'
  desc 'Root login should be disable'
  describe sshd_config do
    its('PermitRootLogin') { should cmp 'no' }
  end
end

control 'sshd-03' do
  impact 1.0
  title 'Disable forwarding with openssh'
  desc 'Tcp and x11 forwarding should be disable with openssh'
  describe sshd_config do
    its('AllowTcpForwarding') { should cmp 'no' }
    its('X11Forwarding') { should cmp 'no' }
  end
end

control 'sshd-04' do
  impact 1.0
  title 'Idle session'
  desc 'Set interval of idle session'
  describe sshd_config do
    its('ClientAliveInterval') { should cmp '300' }
    its('ClientAliveCountMax') { should cmp '2' }
  end
end

control 'sshd-05' do
  impact 1.0
  title 'Pam authentification'
  desc 'Openssh should be use pam authentification'
  describe sshd_config do
    its('UsePAM') { should cmp 'yes' }
  end
end

control 'sshd-06' do
  impact 1.0
  title 'Openssh banner'
  desc 'Openssh should have a banner'
  describe sshd_config do
    its('Banner') { should cmp '/etc/issue.net' }
  end
end

control 'sshd-07' do
  impact 1.0
  title 'Privilege separation'
  desc 'Allow the OpenSSH server to run a small (necessary) amount of code as root and the of the code in a chroot jail environment'
  describe sshd_config do
    its('UsePrivilegeSeparation') { should match(/sandbox|yes/) }
  end
end

control 'sshd-08' do
  impact 1.0
  title 'Authentification retry'
  desc 'Authentification retry should be limited by max connection non-authentified connexion concurency and max try'
  describe sshd_config do
    its('MaxAuthTries') { should cmp '5' }
    its('MaxStartups') { should cmp '10:30:100' }
  end
end
