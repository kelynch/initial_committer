#!/usr/bin/env ruby

require 'git'
require 'zaru'

require 'pry'

def missing_args?
  return (ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?)
end

abort('Argument(s) missing') if missing_args?

project = Zaru.sanitize!(ARGV[0])

project_path = "#{ARGV[1]}/#{project}"

project_namespace = ARGV[2]

branch_name = "features/#{project.upcase}-0-Initial_commit"

FileUtils.mkdir_p(project_path)

Git.init(project_path)

git = Git.clone(project_path, "clones/#{project}")

git.config('user.name', 'Kate Lynch')
git.config('user.email', 'katherly@upenn.edu')

gitignore = File.new("clones/#{project}/.gitignore", 'w+')
readme = File.new("clones/#{project}/README.md", 'w+')
license = File.new("clones/#{project}/LICENSE", 'w+')
code_file = File.new("clones/#{project}/#{project}.rb", 'w+')

gitignore.write(File.read('templates/gitignore_content'))
code_file.write(File.read('templates/code_template_ruby'))
license.write(File.read('templates/license_content'))
readme.write(File.read('templates/readme_content').gsub('{{project_name}}', project).gsub('{{namespace}}',project_namespace))

`git add .gitignore`

`git commit "Modified gitignore"`

`git checkout -b #{branch_name}`

`git add .`

`git commit -m "Initial commit"`

`git checkout master`

`git merge #{branch_name}`

FileUtils.rm_r("clones/#{project}")

puts 'Done'
