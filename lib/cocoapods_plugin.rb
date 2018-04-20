require_relative 'githooks'
require_relative 'synchooks'

module CocoapodsGitHooks
  Pod::HooksManager.register('cocoapods-githooks', :post_install) do |context|
    githooks = GitHooks.new()
    githooks.sync()
  end
  Pod::HooksManager.register('cocoapods-githooks', :post_update) do |context|
    githooks = GitHooks.new()
    githooks.sync()
  end
end