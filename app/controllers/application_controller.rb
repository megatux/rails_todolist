class ApplicationController < ActionController::Base

  @@colors = [
    "#eed7a1", "#ffeeee", "#fffaee", "#eefff8", "#b9e2f5",
    "#fff5ee", "#eeffee", "#eef1ff", "#fbeeff",
    "#eefcff", "#f7efd2", "#cd8b62", "#dcf0fa",
    "#ffeef8", "#edf7fc", "#fcffee",
  ]
  @@colors_index = 0

  def next_color
    semaphore = Thread::Mutex.new
    semaphore.synchronize {
      ret = @@colors[@@colors_index % @@colors.length]
      @@colors_index += 1
      ret
    }
  end
  helper_method :next_color
end
