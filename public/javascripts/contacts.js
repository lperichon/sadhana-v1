$(document).ready(function(){
  $('.contact').click(function(contact) {
    Contacts.select_contact($(contact.currentTarget).children('p').html());
  });
});

var Contacts = {
  select_contact: function(email) {
    opener.document.forms[6].user_email.value = email;
    self.close();
  }
};