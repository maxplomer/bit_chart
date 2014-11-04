FinanceClone.Collections.Companies = Backbone.Collection.extend({
  model: FinanceClone.Models.Company,
  url: '/api/companies',

  getOrFetch: function (id) {
    var companies = this;

    var company;
    if (company = this.get(id)) {
      company.fetch();
    } else {
      company = new FinanceClone.Models.Company({ id: id });
      company.fetch({
        success: function () { companies.add(company); }
      });
    }

    return company;
  }

});

FinanceClone.Collections.companies = new FinanceClone.Collections.Companies();