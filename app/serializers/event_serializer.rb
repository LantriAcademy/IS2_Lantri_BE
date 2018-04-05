class EventSerializer < ActiveModel::Serializer
  attributes :id,:startDate,:direction,:latitude,:longitude,:description,:foundation_id
end
