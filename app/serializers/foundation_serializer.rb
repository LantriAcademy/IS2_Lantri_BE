class FoundationSerializer < ActiveModel::Serializer
  attributes :id,:name,:direction,:latitude,:longitude,:avatar,:description,:howToHelp,:contactUs
end
