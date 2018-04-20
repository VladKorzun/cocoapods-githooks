require 'cocoapods'
require 'fileutils'

module CocoapodsGitHooks
	class GitHooks
		def sync
			Pod::UI.puts "Synchronizing git hooks"
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
			FileUtils.chmod("+x", ".git/hooks/.")
		end
	end
end