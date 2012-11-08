module PracticesHelper
  def first_part(practice)
    if current_user.subscription_plan == SubscriptionPlan.default_plan
      result = practice.practice_parts.find {|pp| pp.part.symbol == 'asana'}
      first_part = result.part unless result.blank?
    else
      first_part = practice.practice_parts.first.part unless practice.practice_parts.empty?
    end

    first_part
  end

  def first_part_index(practice)
    if current_user.subscription_plan == SubscriptionPlan.default_plan
      first_part = practice.practice_parts.find {|pp| pp.part.symbol == 'asana'}
      first_part_index = 0
      unless first_part.blank?
        first_part_index = practice.practice_parts.index first_part
      end
    else
      first_part_index = 0
    end

    first_part_index
  end

  def disabled_parts(practice)
    if current_user.subscription_plan == SubscriptionPlan.default_plan
      first_part = practice.practice_parts.find {|pp| pp.part.symbol == 'asana'}
      first_part_index = 0
      unless first_part.blank?
        first_part_index = practice.practice_parts.index first_part
        disabled_parts = (0..practice.practice_parts.count).to_a.reject {|i| i == first_part_index}
      end
    else
      disabled_parts = []
    end

    return "[#{disabled_parts.join(',')}]"
  end
end
