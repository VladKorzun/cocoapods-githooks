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
            
            scriptList = Dir['.git-hooks/*']
            
			if scriptList.empty?
				Pod::UI.puts ".git-hooks folder is empty, nothing to sync"
				return
			end
            
			if !File.directory?(".git/hooks")
				FileUtils.mkdir ".git/hooks"
			end
            
            scriptList.each do |script|
                filename = File.basename(script, File.extname(script))
                hookPath = ".git/hooks/#{filename}"
                FileUtils.cp(script, hookPath)
                FileUtils.chmod("+x", hookPath)
            end
			Pod::UI.puts "Git hooks synchronized"
		end
	end
end
