const APIUtil = require("./util/api_util.js")

class FollowToggle {
    constructor(el) {
    
    this.el = $(el);
    this.userId = this.el.data("user-id");
    this.followState = this.el.data("initial-follow-state") ? "Followed" : "Unfollowed";
    this.render();
    this.el.on("click", this.handleClick.bind(this));
    }


    render () {
        if (this.followState === "Followed") {

            this.el.text("Unfollow!")
        }
        else {
            this.el.text("Follow!")
        }

        if (this.followState === "following" || this.followState === "unfollowing") {
            this.el.attr("disabled", true);
        } else {
            this.el.removeAttr("disabled");
        }


    }

    handleClick (e) {
        e.preventDefault();

        if (this.followState === "Unfollowed") {
            this.followState = "following"
            this.render();

            APIUtil.followUser(this.userId).then(() => {
                this.followState = "Followed";   
                this.render();             
            });
            
            
        } else {
            this.followState = "unfollowing"
            this.render();
            
            APIUtil.unfollowUser(this.userId).then(() => {
                this.followState = "Unfollowed";
                this.render();
            });        
  
        }
    }

}


module.exports = FollowToggle;