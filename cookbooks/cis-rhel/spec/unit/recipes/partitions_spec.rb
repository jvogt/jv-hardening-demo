#
# Cookbook:: cis-rhel
# Spec:: partitions
#
# Copyright:: 2018, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'cis-rhel::partitions' do
  context 'When all attributes are default, on an CentOS 7' do
    cached(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end

    it 'enables /tmp mount with attributes' do
      expect(chef_run).to enable_mount('/tmp').with(
        pass:    0,
        fstype:  'tmpfs',
        device:  'tmpfs',
        options: %w(nodev nosuid noexec)
      )
    end

    it 'mounts a /tmp with attributes' do
      expect(chef_run).to mount_mount('/tmp').with(
        pass:    0,
        fstype:  'tmpfs',
        device:  'tmpfs',
        options: %w(nodev nosuid noexec)
      )
    end
  end
end
