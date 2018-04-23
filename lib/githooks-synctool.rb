require 'cocoapods'
require 'fileutils'

module CocoapodsGitHooks
	class GitHooksSynctool
		def sync
			Pod::UI.puts "Synchronizing git hooks"
			if !File.directory?(".git")
				Pod::UI.puts "It is not a git repository, aborting"
				return
			end
			if !File.directory?(".git-hooks")
				Pod::UI.puts ".git-hooks directory not found, nothing to sync"
				return
			end
			if Dir['.git-hooks/*'].empty?
				Pod::UI.puts ".git-hooks directory is empty, nothing to sync"
				return
			end
			if !File.directory?(".git/hooks")
				FileUtils.mkdir ".git/hooks"
			end

			FileUtils.cp_r(".git-hooks/.", ".git/hooks/")
			path = ".git/hooks/"
			Dir.open(path).each do |p|
  				next if File.extname(p) != ".sh"
  				filename = File.basename(p, File.extname(p))
  				FileUtils.mv("#{path}/#{p}", "#{path}/#{filename}")
			end
			FileUtils.chmod("+x", ".git/hooks/.")
			Pod::UI.puts "Git hooks synchronized"
		end
	end
end