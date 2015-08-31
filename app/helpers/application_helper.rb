module ApplicationHelper

  def priority_ratings_array
    [1, 2, 3, 4, 5]
  end

  def include_action_sort_options
    [
      ['Highest Priority', 1],
      ['Lowest Priority', 2],
      # ['Included', 3],
      # ['Not Included', 4],
    ]
  end

  def include_sort_value(number)
    case number
    when 1 || '1'
      'priority ASEC'
    when 2 || '2'
      'priority DESC'
    end
  end
end
