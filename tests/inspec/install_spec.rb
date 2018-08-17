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
  title 'Openssh server config file'
  desc 'sshd_config should be only writtable and readable by root'
  describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_writable.by('owner') }
    it { should_not be_executable }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end

control 'install-03' do
  impact 1.0
  title 'Openssh client config file'
  desc 'ssh_config should be only writtable and readable by root'
  describe file('/etc/ssh/sshd_config') do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_writable.by('owner') }
    it { should_not be_executable }
    it { should_not be_readable.by('group') }
    it { should_not be_readable.by('other') }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end
