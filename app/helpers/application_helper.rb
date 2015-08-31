module ApplicationHelper

  def priority_ratings_array
    [1, 2, 3, 4, 5]
  end

  def roles_for_select(plan)
    plan.roles.collect{|role| [role.doer, role.id]}
  end

  def priority_for_select
    [
      ['Highest Priority', 'ASC'],
      ['Lowest Priority', 'DESC'],
    ]
  end
end
