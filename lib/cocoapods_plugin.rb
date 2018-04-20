require_relative 'githooks'

module CocoapodsGitHooks
  Pod::HooksManager.register('cocoapods-githooks', :post_install) do |context|
    githooks = GitHooks.new()
    githooks.sync(context)
  end
end