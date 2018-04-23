# cocoapods-githooks

GitHooks is a simple CocoaPods plugin that syncs git hooks between team members. 
Create .git-hooks directory just beside your .git folder. Place all shared hooks into .git-hooks and commit to your repository.
GitHooks plugin will copy shared hooks into .git/hooks directory and make them executable every time you running 'pod install' or 'pod update'. 

## Installation

    $ gem install cocoapods-githooks

## Usage

1. Create '.git-hooks' directory in root of your project
2. Add git hooks scripts into '.git-hooks'. You can leave file extension for Shell Scripts and don't need to worry about making them exetutable. 
3. Require 'cocoapods-githooks' plugin in your Podfile

```ruby
plugin 'cocoapods-githooks'
```

4. Run

	$ pod install 

or

	$ pod update

or

	$ pod githooks

to sync git hooks. 

