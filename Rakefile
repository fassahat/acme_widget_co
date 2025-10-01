# frozen_string_literal: true

require 'rake'
require 'rspec/core/rake_task'

# RSpec task
RSpec::Core::RakeTask.new(:spec)

# RuboCop task
require 'rubocop/rake_task'
RuboCop::RakeTask.new

# Default task runs both linting and tests
task default: %i[rubocop spec]
