FinanceClone.Views.UserShow = Backbone.View.extend({

  template: JST['users/show'],

  events: {
    "submit form": "submit"
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
  }

});
