require 'cocoapods'
require_relative 'githooks'

# The CocoaPods check command.

include CocoapodsGitHooks

module Pod
	class Command
		class Synchooks < Command
			self.summary = <<-SUMMARY
          		Syncs hooks between team members
      		SUMMARY

      		self.description = <<-DESC
          		CocoaPods plugins that sync git-hooks placed in .git-hooks directory between team members
      		DESC

			self.arguments = []

      		def run
      			githooks = CocoapodsGitHooks::GitHooks.new()
      			githooks.sync()
      		end
    	end
    end
end