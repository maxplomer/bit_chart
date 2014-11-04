window.FinanceClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert("hello from backbone");
    new FinanceClone.Routers.Companies({
      $rootEl: $("#content")
    });
    Backbone.history.start();
  }
};