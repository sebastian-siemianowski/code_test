# frozen_string_literal: true

module CachingHelpers
  def file_caching_path
    path = 'tmp/test_msm/cache'
    FileUtils.mkdir_p(path)

    path
  end
end
