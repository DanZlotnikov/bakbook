module ApplicationHelper
  def sortable (column_name, sort_by)
    direction = sort_by == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to column_name, :sort => sort_by, :direction => direction, :industry => sort_industry
  end
end
