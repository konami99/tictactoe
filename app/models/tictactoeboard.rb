class Tictactoeboard < ApplicationRecord

  after_update_commit -> { broadcast_replace_to "tictoctoeboards" }

end