require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/crack'
require './lib/key'
require './lib/offset'
require './lib/shift'
