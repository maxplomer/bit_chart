FinanceClone.Routers.Companies = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "": "home",
    "users": "usersIndex",
    "usersfollow": "usersFollowIndex",
    "companies/:id": "show",
    "users/:id": "userShow"
  },

  show: function (id) {
    sidebar();
    var company = FinanceClone.Collections.companies.getOrFetch(id);
    var showView = new FinanceClone.Views.CompanyShow({ 
      model: company 
    });
    
    this._swapView(showView);
  },

  userShow: function (id) {
    sidebar();
    FinanceClone.Collections.companies.fetch();
    FinanceClone.Collections.follows.fetch();
    var user = FinanceClone.Collections.users.getOrFetch(id);
    var showView = new FinanceClone.Views.UserShow({
      model: user,
      collection: FinanceClone.Collections.companies
    });
    
    this._swapView(showView);
  },

  usersIndex: function () {
    sidebar();
    FinanceClone.Collections.users.fetch();
    var indexView = new FinanceClone.Views.UsersIndex({
      collection: FinanceClone.Collections.users
    });
    this._swapView(indexView);
  },

  usersFollowIndex: function () {
    sidebar();
    FinanceClone.Collections.users.fetch();
    var indexView = new FinanceClone.Views.UsersFollowIndex({
      collection: FinanceClone.Collections.users
    });
    this._swapView(indexView);
  },

  home: function () {
    sidebar();
    //will eventually want to fetch notification messages and recent quotes, no!! this will be done elsewhere
    var homeView = new FinanceClone.Views.Home({});
    this._swapView(homeView);

  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    this.$rootEl.html(view.render().$el);
  }
});



