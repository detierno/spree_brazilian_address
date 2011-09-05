require 'spec_helper'

describe Address do  
  
  context "Brazilian Address" do
    before(:each) do
      @address = Factory.build(:address)
    end
    
    it "should be invalid without number, neighborhood and phone area" do
      @address.should be_invalid
    end
    
    it "should be valid without number, neighborhood and phone area" do
      @address.number = '123'
      @address.phone_area = '11'
      @address.neighborhood = 'some neighborhood'
      
      @address.should be_valid
    end
    
  end
  
  context "With attributes for user" do
    
  end
  
end