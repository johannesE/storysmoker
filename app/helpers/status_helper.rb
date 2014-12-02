module StatusHelper


 def unlockDB
  if !session[:current_story_id].nil?
   if Story.find(session[:current_story_id]).status == 'locked'
    Story.find(session[:current_story_id]).update_attribute(:status, 'editable')
	session[:current_story_id] = nil;
   end
  end
 end




end
