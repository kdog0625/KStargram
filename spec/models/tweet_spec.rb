require 'rails_helper'

describe Tweet do
  describe '#create' do
    it "titleがない場合、保存できないこと" do
      tweet = build(:tweet, title: nil)
      tweet.valid?
      expect(tweet.errors[:title]).to include("can't be blank")
    end

    it "imageがない場合、保存できないこと" do
      tweet = build(:tweet, image: nil)
      tweet.valid?
      expect(tweet.errors[:image]).to include("can't be blank")
    end

    it "tempがない場合、保存できないこと" do
      tweet = build(:tweet, temp: nil)
      tweet.valid?
      expect(tweet.errors[:temp]).to include("can't be blank")
    end

    it "typestyleがない場合、保存できないこと" do
      tweet = build(:tweet, typestyle: nil)
      tweet.valid?
      expect(tweet.errors[:typestyle]).to include("can't be blank")
    end

    it "seasonがない場合、保存できないこと" do
      tweet = build(:tweet, season: nil)
      tweet.valid?
      expect(tweet.errors[:season]).to include("can't be blank")
    end

    it "sexがない場合、保存できないこと" do
      tweet = build(:tweet, sex: nil)
      tweet.valid?
      expect(tweet.errors[:sex]).to include("can't be blank")
    end

    it "tallがない場合、保存できないこと" do
      tweet = build(:tweet, tall: nil)
      tweet.valid?
      expect(tweet.errors[:tall]).to include("can't be blank")
    end

    it "textがない場合、保存できないこと" do
      tweet = build(:tweet, text: nil)
      tweet.valid?
      expect(tweet.errors[:text]).to include("can't be blank")
    end

    it "title,image,temp,typestyle,season,sex,tall,textがある時に保存できるかどうか" do
      tweet = build(:tweet)
      expect(tweet).to be_valid
    end
  end
end