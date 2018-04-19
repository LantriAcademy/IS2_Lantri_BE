class EventSerializer < ActiveModel::Serializer
  attributes :id,:name,:startDate,:direction,:latitude,:longitude,:description,:foundation_id
end
