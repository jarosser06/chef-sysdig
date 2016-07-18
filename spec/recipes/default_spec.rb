require_relative '../spec_helper'

describe 'sysdig::default' do
  describe 'when platform is ubuntu' do
    before do
      stub_command('apt-key list | grep -i EC51E8C4').and_return(false)
    end

    let(:chef_run) do
      chef_runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04')
      chef_runner.converge(described_recipe)
    end

    it 'adds apt repository' do
      expect(chef_run).to add_apt_repository('sysdig')
    end
  end

  describe 'when platform is rhel or fedora' do
    let(:chef_run) do
      chef_runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0')
      chef_runner.converge(described_recipe)
    end

    it 'includes yum epel' do
      expect(chef_run).to include_recipe('yum-epel')
    end

    it 'adds the yum repository' do
      expect(chef_run).to create_yum_repository('sysdig')
    end
  end

  let(:chef_run) { ChefSpec::SoloRunner.new().converge(described_recipe) }

  it 'installs sysdig' do
    expect(chef_run).to install_package('sysdig')
  end
end
