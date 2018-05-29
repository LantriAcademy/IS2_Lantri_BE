class DisableAccountJob < ApplicationJob
  queue_as :default

  def perform(*args)
    if args[1] == "contributor"
      u = Contributor.find(args[0])
    elsif args[1] == "director"
      u = Director.find(args[0])
    end
    u.disable_count = 0
    u.save
  end
end
