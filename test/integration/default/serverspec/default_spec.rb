require 'inspec'

describe file('/etc/motd') do
  it { should exist }
  it { should be_file }
  its('content') { should match /Hello/ }
end
