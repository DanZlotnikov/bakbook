module ApplicationHelper
  def sortable (column_name, sort_by)
    direction = sort_by == sort_column && sort_direction == "asc" ? "desc" : "asc"
    user_id = params[:user_id].nil? ? 0 : params[:user_id]
    link_to column_name, :user_id => user_id, :sort => sort_by, :direction => direction, :industry => sort_industry
  end
end
