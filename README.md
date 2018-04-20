# cocoapods-githooks

GitHooks is a simple CocoaPods plugin that syncs git hooks between team members. 
Create .git-hooks directory just beside your .git folder. Place all shared hooks into .git-hooks and commit to your repository.
GitHooks plugin will copy shared hooks into .git/hooks directory and make them executable after you running 'pod install'. 

## Installation

    $ gem install cocoapods-githooks

## Usage

```ruby
# Podfile

plugin 'cocoapods-githooks'
```
