# frozen_string_literal: true

task :build_frontend do
  cd 'front' do
    sh 'npm install'
    sh 'npm run release'
  end
end

if Rails.env.production?
  Rake::Task['assets:precompile'].enhance(%i[build_frontend])
end
