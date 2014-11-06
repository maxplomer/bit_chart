FinanceClone.Views.UsersFollowIndex = Backbone.View.extend({

  template: JST['users/followindex'],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      users: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }

});