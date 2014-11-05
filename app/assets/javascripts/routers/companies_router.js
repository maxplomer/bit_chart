FinanceClone.Routers.Companies = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "companies/:id": "show",
    "users/:id": "userShow"
  },

  show: function (id) {
    var company = FinanceClone.Collections.companies.getOrFetch(id);
    var showView = new FinanceClone.Views.CompanyShow({ 
      model: company 
    });
    
    this._swapView(showView);
  },

  userShow: function (id) {
    FinanceClone.Collections.companies.fetch();
    FinanceClone.Collections.trades.fetch();
    FinanceClone.Collections.users.fetch();
    var user = FinanceClone.Collections.users.getOrFetch(id);
    var showView = new FinanceClone.Views.UserShow({
      model: user,
      collection: FinanceClone.Collections.companies
    });
    
    this._swapView(showView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    this.$rootEl.html(view.render().$el);
  }
});
