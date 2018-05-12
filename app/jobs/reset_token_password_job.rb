class ResetTokenPasswordJob < ApplicationJob
  queue_as :default

  def perform(*args)
    if args[1] == "contributor"
      u = Contributor.find(args[0])
    elsif args[1] == "director"
      u = Director.find(args[0])
    end
    u.token_reset_pass = nil
    u.save
  end
end
