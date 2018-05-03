class EventFinishJob < ApplicationJob
  queue_as :default

  def perform(*args)
    e = Event.find(args[0])
    e.finish = true
    e.save
  end
  
end
