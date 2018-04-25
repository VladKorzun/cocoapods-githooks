require 'command/githooks'
require_relative 'githooks-sync'

module CocoapodsGitHooks
  Pod::HooksManager.register('cocoapods-githooks', :post_install) do |context|
    GitHooksSync.new().sync()
  end
  Pod::HooksManager.register('cocoapods-githooks', :post_update) do |context|
    GitHooksSync.new().sync()
  end
end