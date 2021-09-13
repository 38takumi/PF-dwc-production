class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"
  # class_name: "Customer"を定義することでCustomerテーブルのレコードを参照する
end