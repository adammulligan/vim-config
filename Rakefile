require 'rake'

def handle_existing_file(filename)
  if File.exists?(filename)
    puts "#{filename} already exists, backup (b) or delete (d)?"

    backup = false
    case STDIN.gets.chomp.downcase
    when 'b' then backup = true
    end

    `mv "#{filename}" "#{filename}.backup"`  if backup == true
    FileUtils.rm_rf(filename)
  end
end

desc "Install vim files"
task :install do
  vim_directory = "#{ENV['HOME']}/.vim"
  handle_existing_file(vim_directory)
  `mv "#{Dir.pwd}" "#{vim_directory}"`

  `git clone https://github.com/gmarik/vundle #{Dir.pwd}/bundle/vundle`

  vimrc_file = "#{ENV['HOME']}/.vimrc"
  handle_existing_file(vimrc_file)
  `ln -ns "#{Dir.pwd}/vimrc" "#{vimrc_file}"`

  Dir.mkdir("#{Dir.pwd}/_temp")
  Dir.mkdir("#{Dir.pwd}/_backup")

  # Bundle install for vim
  `vim +BundleInstall +qall`
end

task :uninstall do
end

task :default => 'install'
