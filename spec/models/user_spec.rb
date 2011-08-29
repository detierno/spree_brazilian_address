require 'spec_helper'

describe User do
  
  context "personal account" do
    before(:each) do
      @user = Factory.build(:user, :account_type => "personal", :cpf => "63152470592")
    end
    
    it "should be invalid without cpf" do
      @user.cpf = nil
      @user.should be_invalid
    end
    
    it "should be invalid with a invalid cpf" do
      @user.cpf = '111.23131'
      @user.should be_invalid
      @user.errors[:cpf].should be_present
    end
    
    it "should be valid with formated cpf" do
      @user.cpf = '631.524.705-92'
      @user.save
      @user.should be_valid
    end
    
    it "shoud be valid with a valid a cpf" do
      @user.should be_valid
    end
    
    it "should have a unique cpf" do
      @user.should be_valid
      @user.save
      
      @user2 = Factory.build(:user, :account_type => "personal", :cpf => "63152470592")
      @user2.should be_invalid
      @user2.errors[:cpf].should be_present
    end
  end
  
  context "bussines account" do
    before(:each) do
      @user = Factory.build(:user, :account_type => "business", :cnpj => "73468086000155", :razao_social => "Some razao social", :inscricao_estadual => "isento")
    end
    
    it "should be invalid without CNPJ and Razao Social" do
      @user.cnpj = nil
      @user.razao_social = nil
      @user.should be_invalid
    end
    
    it "should be invalid with Razao Social and without CNPJ" do
      @user.cnpj = nil
      @user.should be_invalid
    end
    
    it "should be invalid with wrong CNPJ " do
      @user.cnpj = '73468086000151'
      @user.should be_invalid
    end
    
    it "should be valid with formated CNPJ" do
      # @user.cnpj = "73.468.086/0001-55"
      # @user.should be_valid
    end
    
    it "should have a unique CNPJ" do
      @user.save
      
      @user2 = Factory.build(:user, :account_type => "business", :cnpj => "73468086000155", :razao_social => "Some razao social b", :inscricao_estadual => "isento")
      @user2.should be_invalid
    end
  end
  
  context "account with business and personal infos" do   
  end
  
end