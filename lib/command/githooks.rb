require 'cocoapods'
require 'githooks-sync'

include CocoapodsGitHooks

module Pod
	class Command
		class Githooks < Command
			self.summary = <<-SUMMARY
        Syncs hooks between team members
      SUMMARY

      self.description = <<-DESC
        CocoaPods plugins that syncs git-hooks placed in .git-hooks directory between team members
      DESC

			self.arguments = []

      def run
        CocoapodsGitHooks::GitHooksSync.new.sync()
      end
    end
  end
end