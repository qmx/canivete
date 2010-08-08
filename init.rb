$:.unshift(File.join(File.dirname(__FILE__), "lib"))
require 'rubygems'
require 'bundler'

Bundler.setup
Bundler.require :default
