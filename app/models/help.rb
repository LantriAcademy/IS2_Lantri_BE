class Help < ApplicationRecord
    has_one :contributor
    has_one :benefited
    has_one :support
    has_one :type_of_help
    has_one :status_of_help
end
