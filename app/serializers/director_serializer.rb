class DirectorSerializer < ActiveModel::Serializer
    attributes :id,:bio,:name,:user,:lastname,:email,:phone,:foundation_id
end
