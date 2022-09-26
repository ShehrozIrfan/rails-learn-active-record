class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
    def benchmark
      puts "*** Recording start time ***"
      start_time = Time.now
      yield
      puts "*** Recording end time ***"
      end_time = Time.now
      puts "*** The process took: #{end_time - start_time} s"
    end
end
