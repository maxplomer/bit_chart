FinanceClone.Views.CompanyShow = Backbone.View.extend({

  template: JST['companies/show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var renderedContent = this.template({
      company: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }

});



  //want to rerender page/graph when new quote is added to rails database