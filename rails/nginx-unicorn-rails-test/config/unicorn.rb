rails_root = File.expand_path('../../', __FILE__)

ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"

worker_processes  1
working_directory rails_root
pid               File.expand_path 'tmp/pids/unicorn.pid', rails_root
listen            8080
preload_app       true