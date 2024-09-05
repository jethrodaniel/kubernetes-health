module Kubernetes
  module Health
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'kubernetes/health/rack_on_rake.rake'
        load 'kubernetes/health/lock_on_rake.rake'
        if Kubernetes::Health::Config.enable_rack_on_migrate
          Rake::Task['db:migrate'].enhance(['kubernetes_health:rack_on_rake'])
        end
        if Kubernetes::Health::Config.enable_lock_on_migrate
          Rake::Task['db:migrate'].enhance(['kubernetes_health:lock_on_rake'])
        end
      end
    end
  end
end
