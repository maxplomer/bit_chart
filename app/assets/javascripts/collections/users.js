FinanceClone.Collections.Users = Backbone.Collection.extend({
  model: FinanceClone.Models.User,
  url: '/api/users',

  comparator: function(user) {
    return -Number(user.get('profit'));
  },


  getOrFetch: function (id) {
    var users = this;

    var user;
    if (user = this.get(id)) {
      user.fetch();
    } else {
      user = new FinanceClone.Models.User({ id: id });
      user.fetch({
        success: function () { users.add(user); }
      });
    }

    return user;
  }

});

FinanceClone.Collections.users = new FinanceClone.Collections.Users();