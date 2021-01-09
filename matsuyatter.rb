# -*- coding: utf-8 -*-

require 'matsuya'

Plugin.create(:matsuyatter) do
  command(:matsuyatter_post_okanic_menu,
          name: '松屋に行く',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox) do |opt|
    compose(opt.world, body: Matsuya.order)
  end

  command(:matsuyatter_abduction,
          name: '松屋に拉致する',
          condition: lambda{ |opt| opt.messages.all? &:repliable? },
          visible: true,
          role: :timeline) do |opt|
    opt.messages.each do |m|
      compose(opt.world, m, body: "@#{m.user.idname} #{Matsuya.order}")
    end
  end
end
