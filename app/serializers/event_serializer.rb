class EventSerializer < ActiveModel::Serializer
  attributes :id,:startDate,:direction,:latitude,:longitude,:descripcion,:foundation_id
end
