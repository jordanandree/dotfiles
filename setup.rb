require "fileutils"

symlink_sources = [
  ".bash_profile",
  ".inputrc",
  ".tmux.conf",
  ".config/nvim",
  ".config/kitty",
  "bin",
  "bash",
]

cwd = File.expand_path(File.dirname(__FILE__))
user_home = Dir.home

Dir.chdir user_home
symlink_sources.each { |source|
  unless Dir.exist?(source) or File.exist?(source)
    FileUtils.symlink "#{cwd}/#{source}", source
    puts "Symlinked #{source} to #{source}"
  end
}
Dir.chdir cwd
