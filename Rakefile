require 'prmd/rake_tasks/combine'
require 'prmd/rake_tasks/verify'
require 'prmd/rake_tasks/doc'

namespace :schema do
  Prmd::RakeTasks::Combine.new do |t|
    t.options[:meta] = 'schema/meta.json'
    t.paths << 'schema/schemata'
    t.output_file = 'source/schema.json'
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << 'source/schema.json'
  end

  Prmd::RakeTasks::Doc.new do |t|
    t.options[:prepend] = ['schema/preface.md']
    t.options[:http_header] = {'Accept' => 'application/vnd.betternow+json; version=1'}
    t.files = { 'source/schema.json' => 'source/includes/resources.md' }
  end
end

task default: ['schema:combine', 'schema:verify', 'schema:doc']
