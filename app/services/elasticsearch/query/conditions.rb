module Elasticsearch
  module Query
    module Conditions

      def user_id
        { 'term' => { 'user_id' => params[:user_id] }}
      end

      def id
        { 'terms' => { 'id' => params[:id].split(',') }} if params[:id]
      end

      def title
        { 'match_phrase' => { 'title' => params[:title].downcase }} if params[:title]
      end

      def description
        { 'prefix' => { 'description' => params[:description].downcase }} if params[:description]
      end

      def price_gteq
        {
          "range" => {
            "price" => {
              "gte" => params[:price_gteq].to_i
            }
          }
        } if params[:price_gteq]
      end

      def price_lteq
        {
          "range" => {
            "price" => {
              "lte" => params[:price_lteq].to_i
            }
          }
        } if params[:price_lteq]
      end

      def sort
        case sort_by
        when :id
          { 'id' => { 'order' => sort_order }}
        when :title
          { 'title' => { 'order' => sort_order, 'missing' => null_position }, 'id' => { 'order' => sort_order }}
        when :description
          { 'description' => { 'order' => sort_order, 'missing' => null_position }, 'id' => { 'order' => sort_order }}
        when :price
          { 'price' => { 'order' => sort_order, 'missing' => null_position }, 'id' => { 'order' => sort_order }}
        else
          { 'id' => { 'order' => sort_order }}
        end
      end

      def null_position
        sort_order == :asc ? '_first' : '_last'
      end
    end
  end
end
