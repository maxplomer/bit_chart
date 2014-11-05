FinanceClone.Collections.Follows = Backbone.Collection.extend({
  model: FinanceClone.Models.Follow,
  url: '/api/follows',

  getOrFetch: function (id) {
    var follows = this;

    var follow;
    if (follow = this.get(id)) {
      follow.fetch();
    } else {
      follow = new FinanceClone.Models.Follow({ id: id });
      follow.fetch({
        success: function () { follows.add(follow); }
      });
    }

    return follow;
  }

});

FinanceClone.Collections.follows = new FinanceClone.Collections.Follows();