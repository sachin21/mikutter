# -*- coding: utf-8 -*-
# プラグインを全てロードする
miquire :core, "miquire_plugin"

Miquire::Plugin.loadpath << Environment::PLUGIN_PATH << File.join(File.dirname(__FILE__), "..", "..", "plugin") << File.join(Environment::CONFROOT, 'plugin')

if Mopt.plugin.is_a? Array
  ['core', *Mopt.plugin].uniq.each(&Miquire::Plugin.method(:load))
else
  Miquire::Plugin.load_all
end

