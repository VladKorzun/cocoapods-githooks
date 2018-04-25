#!/bin/bash

gem uninstall cocoapods-githooks
gem build cocoapods-githooks.gemspec
gem install cocoapods-githooks-1.0.2.gem --user-install