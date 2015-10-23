class MainController < ApplicationController
  def Index
    @time = Time.now
    @files = Dir.glob('*')
  end
end
