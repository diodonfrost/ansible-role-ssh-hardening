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
    its('PermitRootLogin') { should cmp 'no'}
  end
end

control 'sshd-03' do
  impact 1.0
  title 'Disable forwarding with openssh'
  desc 'Tcp and x11 forwarding should be disable with openssh'
  describe sshd_config do
    its('AllowTcpForwarding') { should cmp 'no'}
    its('X11Forwarding') { should cmp 'no'}
  end
end
