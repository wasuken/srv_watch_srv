class ServerLog < ApplicationRecord
  belongs_to :server
  belongs_to :log
end
