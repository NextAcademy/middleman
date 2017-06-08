// Scripts here will not be applied to Landing Page
// For that, please refer to landing.js
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//

  $(document).ready(function(){
    var selection = $('#company_industry').val();
    if (selection === "other" ){
      $('#industry_text').show()
      $('#industry_text').attr('name','company["industry"]')
    }
    $('#company_industry').on('change',function(){
      var selection = $(this).val();
      if (selection === "other" ){
        $('#industry_text').show()
        $('#industry_text').attr('name','company[industry]')
      }
      else {
        $('#industry_text').hide()
        $('#industry_text').attr('name','empty')
      }
      console.log("hi");
    });
  });