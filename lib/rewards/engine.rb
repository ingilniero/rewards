module Rewards
  class Engine < ::Rails::Engine
    isolate_namespace Rewards

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths["db/migrate"].concat(
          config.paths["db/migrate"].expanded)
      end
    end

    config.generators.assets = false
    config.generators.helper = false

    config.to_prepare do
      ActiveSupport.on_load :active_record do
        include Rewards::ActsAsRewardable
      end
    end
  end
end
