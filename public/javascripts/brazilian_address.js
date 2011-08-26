(function($){
  $(document).ready(function(){

    $('#user_account_type_business').click(function() {
      $('#user_cpf_box').hide();
      $('#user_cnpj_box').show();
      $('#user_razao_box').show();
      $('#user_inscricao_box').show();
    });
    
    $('#user_account_type_personal').click(function() {
      $('#user_cpf_box').show();
      $('#user_cnpj_box').hide();
      $('#user_razao_box').hide();
      $('#user_inscricao_box').hide();
    });
    
    var value = $("input[@name=user[account_type]]:checked").val();
    
    if (value == 'business') {
       $('#user_cpf_box').hide();
       $('#user_cnpj_box').show();
       $('#user_razao_box').show();
       $('#user_inscricao_box').show();
    }
    else if (value == 'personal') {
      $('#user_cpf_box').show();
      $('#user_cnpj_box').hide();
      $('#user_razao_box').hide();
      $('#user_inscricao_box').hide();
    }

  });
})(jQuery);