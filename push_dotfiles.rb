require "git"

log = Dir.home + "/.push_dotfiles.log"

File.open(log, "a") do |file|
  file.puts "\n---\n"
  file.puts "Push at " + Time.now.to_s
  file.puts dotfiles = Git.init(Dir.home + "/dotfiles/")
  file.puts dotfiles.add(:all=>true)
  file.puts dotfiles.commit_all("Automated push at " + Time.now.to_s)
  file.puts dotfiles.push
  file.puts "End of commit"
end

