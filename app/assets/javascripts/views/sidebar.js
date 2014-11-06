FinanceClone.Views.Sidebar = Backbone.View.extend({

  template: JST['sidebar'],

  //will later need a listenTo for the recent quotes collection and notification messages collection

  events: {
    "submit .quote-form": "getQuote"
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({});
    this.$el.html(renderedContent);
    return this;
  },

  getQuote: function (event) {
  	event.preventDefault();
    that = this;
    var params = $(event.currentTarget).serializeJSON();
    var newRecentQuote = new FinanceClone.Models.RecentQuote(params["recent_quote"]);

    newRecentQuote.save({}, {
      success: function () {
        FinanceClone.Collections.recent_quotes.add(newRecentQuote);
        alert(newRecentQuote.escape("company_id"));

        //Backbone.history.navigate("/", { trigger: true });
      }
    });
  }
});