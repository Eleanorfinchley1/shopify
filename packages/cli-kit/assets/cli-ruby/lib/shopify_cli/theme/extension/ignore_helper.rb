# frozen_string_literal: true

module ShopifyCLI
  module Theme
    module Extension
      module IgnoreHelper
        def ignore_operation?(operation)
          path = operation.file_path
          ignore_path?(path)
        end

        def ignore_file?(file)
          path = file.relative_path
          ignore_path?(path)
        end

        def ignore_path?(path)
          is_ignored = ignored_by_ignore_filter?(path)

          if is_ignored && @ctx
            @ctx.debug("ignore #{path}")
          end

          is_ignored
        end

        private

        def ignored_by_ignore_filter?(path)
          ignore_filter&.ignore?(path)
        end
      end
    end
  end
end
