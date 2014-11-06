FinanceClone.Views.Sidebar = Backbone.View.extend({

  template: JST['sidebar'],

  //will later need a listenTo for the recent quotes collection and notification messages collection

  render: function () {
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    return this;
  }

});