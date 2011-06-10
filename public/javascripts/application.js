// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function update_link_token(nt,bu) {
  $("#link_token").val(nt);
  $("#result_url").html('<a href="'+bu+nt+'" class="result_url" id="link_result_url">'+bu+nt+'</a>');
}

$().ready(function(){

  // Validate form links#new
  $("#new_link").validate({debug:true});

  // Generate new token if first visit links#index page
  $("#link_url").change(function(){
    if ($("#link_token").val()=="") {
      $("#link_tiny").click(); }
  });

  // Look to selector domains
  $("#link_domain").change(function(){
    $("#link_tiny").click();
  });

});

