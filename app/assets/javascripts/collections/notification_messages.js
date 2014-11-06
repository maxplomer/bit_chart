FinanceClone.Collections.NotificationMessages = Backbone.Collection.extend({
  model: FinanceClone.Models.NotificationMessage,
  url: '/api/notification_messages',

  getOrFetch: function (id) {
    var notification_messages = this;

    var notification_message;
    if (notification_message = this.get(id)) {
      notification_message.fetch();
    } else {
      notification_message = new FinanceClone.Models.NotificationMessage({ id: id });
      notification_message.fetch({
        success: function () { notification_messages.add(notification_message); }
      });
    }

    return notification_message;
  }

});

FinanceClone.Collections.notification_messages = new FinanceClone.Collections.NotificationMessages();