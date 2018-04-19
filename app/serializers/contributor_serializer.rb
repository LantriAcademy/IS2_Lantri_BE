class ContributorSerializer < ActiveModel::Serializer
  attributes :id,:name,:description,:user,:lastname,:email,:phone,:avatar
end
