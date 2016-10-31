@next_items_with_additional_info = next_newsfeed_items.map do |item|
        {
          id: item.id,
          content: item.content,
          image: item.image,
          source_type: item.source_type,
          source_id: item.source_id,
          source_name: item.source_name_or_title(@profile),
          feed: item.feed_or_nil,
          url: item.url_or_nil,
          tsc: item.time_since_creation
        }
      end