FinanceClone.Collections.Trades = Backbone.Collection.extend({
  model: FinanceClone.Models.Trade,
  url: '/api/trades',

  getOrFetch: function (id) {
    var trades = this;

    var trade;
    if (trade = this.get(id)) {
      trade.fetch();
    } else {
      trade = new FinanceClone.Models.Trade({ id: id });
      trade.fetch({
        success: function () { trades.add(trade); }
      });
    }

    return trade;
  }

});

FinanceClone.Collections.trades = new FinanceClone.Collections.Trades();