FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '北海道' }
    address { '1-1-1' }
    building { 'ほっかいどう' }
    telephone { '09012345678' }
  end
end
