$(document).ready(function(){
  $('.contact').click(function(contact) {
    Contacts.select_contact($(contact.currentTarget).children('p').html());
  });
});

var Contacts = {
  select_contact: function(email) {
    if($(opener.document.forms[6]).is(':visible')) {
      opener.document.forms[6].user_email.value = email;
      self.close();
    }
    else if($(opener.document.forms[7]).is(':visible')) {
      opener.document.forms[7].user_email.value = email;
      self.close();
    }
  }
};