# -*- coding: utf-8 -*-

require File.expand_path File.join(File.dirname(__FILE__), 'userlist')
require File.expand_path File.join(File.dirname(__FILE__), 'sender')
require File.expand_path File.join(File.dirname(__FILE__), 'dmlistview')

module Plugin::DirectMessage
  Plugin.create(:direct_message) do
    def userlist
      @userlist ||= UserList.new end

    @counter = gen_counter
    ul = userlist
    tab(:directmessage, _("DM")) do
      set_icon Skin['directmessage.png']
      expand
      nativewidget ul
    end

    user_fragment(:directmessage, _("DM")) do
      set_icon Skin['directmessage.png']
      u = retriever
      timeline timeline_name_for(u) do
        postbox(from: Sender.new(u), delegate_other: true)
      end
    end

    filter_extract_datasources do |datasources|
      datasources = {
        direct_message: _("ダイレクトメッセージ"),
      }.merge datasources
      Service.map{ |service|
        user = service.user_obj
        datasources.merge!({ extract_slug_for(user) => "@#{user.idname}/" + _("ダイレクトメッセージ") })
      }
      [datasources] end

    def extract_slug_for(user)
      "direct_message-#{user.id}".to_sym
    end

    on_direct_messages do |_, dms|
      dm_distribution = Hash.new {|h,k| h[k] = []}
      dms.each do |dm|
        model = Mikutter::Twitter::DirectMessage.new_ifnecessary(dm)
        dm_distribution[model[:user]] << model
        dm_distribution[model[:recipient]] << model
      end
      dm_distribution.each do |to_user, dm_for_user|
        Plugin::GUI::Timeline.instance(timeline_name_for(to_user)) << dm_for_user
        Plugin.call :extract_receive_message, timeline_name_for(to_user), dm_for_user
      end
      Plugin.call :extract_receive_message, :direct_message, dms
      ul.update(dm_distribution.map{|k, v| [k, v.map{|dm| dm[:created]}.max]}.to_h)
    end

    def timeline_name_for(user)
      :"direct_messages_from_#{user.idname}"
    end

    onperiod do
      if 0 == (@counter.call % UserConfig[:retrieve_interval_direct_messages])
        rewind end end

    def rewind
      service = Service.primary
      if service
        Deferred.when(
            service.direct_messages(cache: :keep),
            service.sent_direct_messages(cache: :keep)
        ).next{ |dm, sent|
          result = dm + sent
          Plugin.call(:direct_messages, service, result) unless result.empty?
        }.trap{ |e|
          error e
          raise e
        }.terminate end end

    rewind

  end
end
