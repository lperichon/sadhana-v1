$(document).ready(function(){
  $('.contact').click(function(contact) {
    Contacts.select_contact($(contact.currentTarget).children('p').html());
  });
});

var Contacts = {
  select_contact: function(email) {
    idx = $(opener.document.forms).length;
    if($(opener.document.forms[idx]).is(':visible')) {
      opener.document.forms[idx].user_email.value = email;
      self.close();
    }
    else if($(opener.document.forms[idx-1]).is(':visible')) {
      opener.document.forms[idx-1].user_email.value = email;
      self.close();
    }
  }
};