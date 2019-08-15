var FollowToggle = require("./follow_toggle.js");

$(() => {
    let $buttons = $(".follow-toggle");
    $buttons.each(function(index, $button) {    
        let buttonToggle = new FollowToggle($button);
  
    });

})

