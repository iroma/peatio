# == Schema Information
#
# Table name: withdraws
#
#  id         :integer          not null, primary key
#  sn         :string(255)
#  account_id :integer
#  member_id  :integer
#  currency   :integer
#  amount     :decimal(32, 16)
#  fee        :decimal(32, 16)
#  fund_uid   :string(255)
#  fund_extra :string(255)
#  created_at :datetime
#  updated_at :datetime
#  done_at    :datetime
#  txid       :string(255)
#  aasm_state :string(255)
#  sum        :decimal(32, 16)  default(0.0), not null
#  type       :string(255)
#

module Withdraws
  class Dogecoin < ::Withdraw
    include ::AasmAbsolutely
    include ::Withdraws::Coinable

    validates :sum, presence: true, numericality: {greater_than: 1}, on: :create

    def set_fee
      self.fee = 1.to_d
    end
  end
end
