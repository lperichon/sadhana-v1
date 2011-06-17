module Analytical
  module Modules
    KissMetrics.class_eval do
      def signed_up(plan_name, *args)
        data = args.first || {}
        "_kmq.push([\"signedUp\", \"#{plan_name}\", #{data.to_json}]);"
      end

      def upgraded(plan_name, *args)
        data = args.first || {}
        "_kmq.push([\"upgraded\", \"#{plan_name}\", #{data.to_json}]);"
      end

      def downgraded(plan_name, *args)
        data = args.first || {}
        "_kmq.push([\"downgraded\", \"#{plan_name}\", #{data.to_json}]);"
      end
    end
  end
end
