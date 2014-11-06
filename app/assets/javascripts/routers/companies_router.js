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
    navbar();
    sidebar();
    var company = FinanceClone.Collections.companies.getOrFetch(id);
    var showView = new FinanceClone.Views.CompanyShow({ 
      model: company 
    });
    
    this._swapView(showView, true);
    //this.$rootEl.html(showView.$el); //could pass an arg to _swapview whether or not to swap, 
    //right now i have zombie views, rerender 
  },

  userShow: function (id) {
    navbar();
    sidebar();
    //FinanceClone.Collections.companies.fetch();
    FinanceClone.Collections.follows.fetch();
    var user = FinanceClone.Collections.users.getOrFetch(id);
    var showView = new FinanceClone.Views.UserShow({
      model: user,
      collection: FinanceClone.Collections.companies
    });
    
    this._swapView(showView);
  },

  usersIndex: function () {
    navbar();
    sidebar();
    FinanceClone.Collections.users.fetch();
    var indexView = new FinanceClone.Views.UsersIndex({
      collection: FinanceClone.Collections.users
    });
    this._swapView(indexView);
  },

  usersFollowIndex: function () {
    navbar();
    sidebar();
    FinanceClone.Collections.users.fetch();
    var indexView = new FinanceClone.Views.UsersFollowIndex({
      collection: FinanceClone.Collections.users
    });
    this._swapView(indexView);
  },

  home: function () {
    navbar();
    sidebar();
    //will eventually want to fetch notification messages and recent quotes, no!! this will be done elsewhere
    var homeView = new FinanceClone.Views.Home({});
    this._swapView(homeView);

  },

  _swapView: function (view, dont_render) {
    this._currentView && this._currentView.remove();
    this._currenView = view;
    if (!dont_render) {
      view.render();  //render puts stuff into the $el
    }
    this.$rootEl.html(view.$el);
  }
});



