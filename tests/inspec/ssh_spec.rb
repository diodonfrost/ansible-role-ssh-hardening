title 'Opensh-client test'

control 'ssh-01' do
  impact 1.0
  title 'Openssh  protocol'
  desc 'Openssh client should be use ssh protocol 2'
  describe ssh_config do
    its('Protocol') { should cmp 2 }
  end
end

control 'ssh-02' do
  impact 1.0
  title 'Openssh roaming'
  desc 'Openssh client should be not be use roaming'
  describe ssh_config do
    its('Useroaming') { should cmp "no" }
  end
end

control 'ssh-03' do
  impact 1.0
  title 'Openssh local command'
  desc 'Local command in openssh should be disable'
  describe ssh_config do
    its('PermitLocalCommand') { should cmp "no" }
  end
end

control 'ssh-04' do
  impact 1.0
  title 'Openssh host IP'
  desc 'Openssh should be check host IP'
  describe ssh_config do
    its('CheckHostIP') { should cmp "yes" }
  end
end

control 'ssh-05' do
  impact 1.0
  title 'Openssh host IP'
  desc 'Openssh should be check host IP'
  describe ssh_config do
    its('CheckHostIP') { should cmp "yes" }
  end
end

control 'sshd-06' do
  impact 1.0
  title 'Disable forwarding with openssh'
  desc 'Tcp and x11 forwarding should be disable with openssh'
  describe ssh_config do
    its('ForwardAgent') { should cmp 'no' }
    its('ForwardX11') { should cmp 'no' }
    its('Tunnel') { should cmp 'no' }
  end
end
