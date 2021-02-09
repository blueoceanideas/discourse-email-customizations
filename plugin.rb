# name: Customize Email Notifications
# about:
# version: 0.0.1

after_initialize do
    require_dependency 'user_notifications'
    module ::UserNotificationsOverride
        def send_notification_email(opts)
            Rails.configuration.paths["app/views"].unshift(File.expand_path("../templates", __FILE__))
            super(opts)
        end
    end

    class ::UserNotifications
        prepend ::UserNotificationsOverride
    end
end
