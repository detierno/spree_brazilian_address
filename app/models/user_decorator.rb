User.class_eval do
  validates_inclusion_of :account_type, :in => %w(personal business)
  validate :valid_cpf, :if => :personal_account?
  validates_uniqueness_of :cpf, :if => :valid_cpf
  
  validates_presence_of :razao_social, :unless => :personal_account? 
  validate :valid_cnpj, :unless => :personal_account?
  validates_uniqueness_of :cnpj, :unless => :personal_account?
  
  attr_accessible :cpf, :cnpj, :razao_social, :inscricao_estadual, :account_type
 
  
  def personal_account?
    return true if self.account_type == 'personal'
    false
  end
  
  def business_account?
    return true if self.account_type == 'business'
    false
  end

  def valid_cpf

    nulos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000}
    
    if !cpf.present? || cpf.nil?
      errors.add(:cpf, :not_present) 
      return false 
    end
    
    
    self.cpf = cpf.gsub(/[^0-9]/,'')
    unless cpf.length == 11
      errors.add(:cpf, :wrong_format) 
      return false
    end  
    
    valor = cpf.scan /[0-9]/
    if valor.length == 11
      unless nulos.member?(valor.join)
        valor = valor.collect{|x| x.to_i}
        soma = 10*valor[0]+9*valor[1]+8*valor[2]+7*valor[3]+6*valor[4]+5*valor[5]+4*valor[6]+3*valor[7]+2*valor[8]
        soma = soma - (11 * (soma/11))
        resultado1 = (soma == 0 or soma == 1) ? 0 : 11 - soma
        if resultado1 == valor[9]
          soma = valor[0]*11+valor[1]*10+valor[2]*9+valor[3]*8+valor[4]*7+valor[5]*6+valor[6]*5+valor[7]*4+valor[8]*3+valor[9]*2
          soma = soma - (11 * (soma/11))
          resultado2 = (soma == 0 or soma == 1) ? 0 : 11 - soma
          return true if resultado2 == valor[10] # CPF válido
        end
      end
    end
    errors.add(:cpf, :invalid) # CPF inválido
  end

  def valid_cnpj
    return false if cnpj.nil?

    nulosb = %w{11111111111111 22222222222222 33333333333333 44444444444444 55555555555555 66666666666666 77777777777777 88888888888888 99999999999999 00000000000000}
    
    if !cnpj.present? || cnpj.nil?
      errors.add(:cnpj, :not_present) 
      return false 
    end
    
    
    self.cnpj = cnpj.gsub(/[^0-9]/,'')
    unless cnpj.length == 14
      errors.add(:cnpj, :wrong_format) 
      return false
    end
    
    valorb = cnpj.scan /[0-9]/
    if valorb.length == 14
      unless nulosb.member?(valorb.join)
        valorb = valorb.collect{|x| x.to_i}
        somab = valorb[0]*5+valorb[1]*4+valorb[2]*3+valorb[3]*2+valorb[4]*9+valorb[5]*8+valorb[6]*7+valorb[7]*6+valorb[8]*5+valorb[9]*4+valorb[10]*3+valorb[11]*2
        somab = somab - (11*(somab/11))
        resultado1b = (somab==0 || somab==1) ? 0 : 11 - somab
        if resultado1b == valorb[12]
          somab = valorb[0]*6+valorb[1]*5+valorb[2]*4+valorb[3]*3+valorb[4]*2+valorb[5]*9+valorb[6]*8+valorb[7]*7+valorb[8]*6+valorb[9]*5+valorb[10]*4+valorb[11]*3+valorb[12]*2
          somab = somab - (11*(somab/11))
          resultado2b = (somab == 0 || somab == 1) ? 0 : 11 - somab
          return true if resultado2b == valorb[13] # CNPJ válido
        end
      end
    end
    errors.add(:cnpj, :invalid) # CPF inválido # CNPJ inválido
  end

end