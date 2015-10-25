# encoding: utf-8

class MainController < ApplicationController
  def Index
    @time = Time.now
    @files = Dir.glob('*')

    begin
      user = Person.new
      user.name = "Mikhail"
      user.age = 21
    #  raise FileSaveError.new("Просто исключение")
    rescue FileSaveError => e
      _a = e.message
      _b = e.backtrace.inspect
      _c = e.reason
    rescue ZeroDivisionError => e
      _a = e.message
      _b = e.backtrace.inspect
    rescue Exception => e
      _a = e.message
      _b = e.backtrace.inspect
    else
        #Вызывается если нет исключения
    ensure
      puts "ending"#Вызывается всегда
    end
  end
end

class FileSaveError < StandardError
  attr_reader :reason
  def initialize(reason)
    @reason = reason
  end
end

class Person < ActiveRecord::Base
  attr_accessor :name, :age
end
