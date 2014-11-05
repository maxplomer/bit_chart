FinanceClone.Collections.Notifications = Backbone.Collection.extend({
  model: FinanceClone.Models.Notification,
  url: '/api/notifications',

  getOrFetch: function (id) {
    var notifications = this;

    var notification;
    if (notification = this.get(id)) {
      notification.fetch();
    } else {
      notification = new FinanceClone.Models.Notification({ id: id });
      notification.fetch({
        success: function () { notifications.add(notification); }
      });
    }

    return notification;
  }

});

FinanceClone.Collections.notifications = new FinanceClone.Collections.Notifications();