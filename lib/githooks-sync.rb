require 'cocoapods'
require 'fileutils'

module CocoapodsGitHooks
	class GitHooksSync
		def sync
			Pod::UI.puts "Synchronizing git hooks"
			if !File.directory?(".git")
				Pod::UI.puts "Git repository not found"
				return
			end
			if !File.directory?(".git-hooks")
				Pod::UI.puts ".git-hooks folder not found, nothing to sync"
				return
			end
			if Dir['.git-hooks/*'].empty?
				Pod::UI.puts ".git-hooks folder is empty, nothing to sync"
				return
			end
			if !File.directory?(".git/hooks")
				FileUtils.mkdir ".git/hooks"
			end

			FileUtils.cp_r(".git-hooks/.", ".git/hooks/")
			path = ".git/hooks/"
			Dir.open(path).each do |p|
				filename = File.basename(p, File.extname(p))
				if File.extname(p) == ".sh"
					FileUtils.mv("#{path}/#{p}", "#{path}/#{filename}")
				end  				
  				FileUtils.chmod("+x", "#{path}/#{filename}")
			end
			Pod::UI.puts "Git hooks synchronized"
		end
	end
end