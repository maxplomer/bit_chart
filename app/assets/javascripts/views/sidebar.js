FinanceClone.Views.Sidebar = Backbone.View.extend({

  template: JST['sidebar'],

  //will later need a listenTo for the recent quotes collection and notification messages collection

  events: {
    "submit .quote-form": "getQuote"
  },

  render: function () {
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    return this;
  },

  getQuote: function (event) {
  	event.preventDefault();
  	alert("gimme quote!")
  }
});