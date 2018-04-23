require_relative 'githooks'
require_relative 'githooks-synctool'

module CocoapodsGitHooks
  Pod::HooksManager.register('cocoapods-githooks', :post_install) do |context|
    githooks = GitHooksSynctool.new()
    githooks.sync()
  end
  Pod::HooksManager.register('cocoapods-githooks', :post_update) do |context|
    githooks = GitHooksSynctool.new()
    githooks.sync()
  end
end