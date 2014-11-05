FinanceClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "submit .form-trade": "submit",
    "submit .form-notification": "submit_notification",
    "submit .form-follow": "submit_follow",
    "submit .form-unfollow": "submit_unfollow"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      user: this.model,
      companies: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    that = this;
    var params = $(event.currentTarget).serializeJSON();
    var newTrade = new FinanceClone.Models.Trade(params["trade"]);

    newTrade.save({}, {
      success: function () {
        FinanceClone.Collections.trades.add(newTrade);
        that.model.fetch();
        //Backbone.history.navigate("/", { trigger: true });
      }
    });
  },

  submit_notification: function (event) {
    event.preventDefault();
    that = this;
    var params = $(event.currentTarget).serializeJSON();
    var newNotification = new FinanceClone.Models.Notification(params["notification"]);

    newNotification.save({}, {
      success: function () {
        FinanceClone.Collections.notifications.add(newNotification);
        that.model.fetch();
        //Backbone.history.navigate("/", { trigger: true });
      }
    });
  },

  submit_follow: function (event) {
    event.preventDefault();
    that = this;
    var params = $(event.currentTarget).serializeJSON();
    var newFollow = new FinanceClone.Models.Follow(params["follow"]);

    newFollow.save({}, {
      success: function () {
        FinanceClone.Collections.follows.add(newFollow);
        that.model.fetch();
        //Backbone.history.navigate("/", { trigger: true });
      }
    });
  },

  submit_unfollow: function (event) {
    event.preventDefault();
    that = this;
    var params = $(event.currentTarget).serializeJSON();
    var follower_id = Number(params["follow"]["follower_id"]);
    var leader_id = Number(params["follow"]["leader_id"]);

    var attrs = {follower_id: follower_id, leader_id: leader_id};

    var follow = FinanceClone.Collections.follows.where(attrs);
    follow = follow[0];

    follow.destroy();
    this.model.fetch();
  },

});
