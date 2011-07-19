Admin::BaseHelper.class_eval do
  
  def formated_cpf(cpf)
    cpf1 = cpf[0...3]
    cpf2 = cpf[3...6]
    cpf3 = cpf[6...9]
    cpf4 = cpf[9...11]
    "#{cpf1}.#{cpf2}.#{cpf3}-#{cpf4}"
  end
  
end