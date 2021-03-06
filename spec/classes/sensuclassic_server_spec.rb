require 'spec_helper'

describe 'sensuclassic' do
  let(:title) { 'sensuclassic::server' }
  let(:facts) do
    {
      :osfamily => 'RedHat',
      :kernel   => 'Linux',
    }
  end

  context 'without server (default)' do

    it { should contain_service('sensu-server').with(
      :ensure     => 'stopped',
      :enable     => false,
      :hasrestart => true
    ) }
  end # without server

  context 'with server' do
    let(:params) { { :server => true } }

    it { should contain_service('sensu-server').with(
      :ensure     => 'running',
      :enable     => true,
      :hasrestart => true
    ) }
  end # with server

  context 'with hasrestart=false' do
    let(:params) { { :server => true, :hasrestart => false } }
    it { should contain_service('sensu-server').with(
      :ensure     => 'running',
      :enable     => true,
      :hasrestart => false
    ) }
  end # with hasrestart=false
end
