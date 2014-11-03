FinanceClone.Collections.Companies = Backbone.Collection.extend({
  model: FinanceClone.Models.Company,
  url: '/api/companies',

  getOrFetch: function (id) {
    var company = this.get(id),
      company = this;
    if(!company) {
      company = new PostApp.Models.Company({ id: id });
      company.fetch({
        success: function () {
          companies.add(company);
        },
      });
    } else {
      company.fetch();
    }
    return company;
  }

});

FinanceClone.Collections.companies = new FinanceClone.Collections.Companies();