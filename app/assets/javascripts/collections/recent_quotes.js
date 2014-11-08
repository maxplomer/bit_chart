FinanceClone.Collections.RecentQuotes = Backbone.Collection.extend({
  model: FinanceClone.Models.RecentQuote,
  url: '/api/recent_quotes',

  comparator: function(recent_quote) {
    return recent_quote.get('id');
  },

  getOrFetch: function (id) {
    var recent_quotes = this;

    var recent_quote;
    if (recent_quote = this.get(id)) {
      recent_quote.fetch();
    } else {
      recent_quote = new FinanceClone.Models.RecentQuote({ id: id });
      recent_quote.fetch({
        success: function () { recent_quotes.add(recent_quote); }
      });
    }

    return recent_quote;
  }

});

FinanceClone.Collections.recent_quotes = new FinanceClone.Collections.RecentQuotes();