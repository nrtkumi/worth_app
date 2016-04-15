module ApplicationHelper
  def current_user?(user)
    current_user.id == user.id
  end

  def what_tag(project)
  	if project.business == 1 then
  		'ビジネス'
  	elsif project.social == 1 then
  		'社会貢献'
  	elsif project.music == 1 then
  		'音楽'
  	elsif project.art == 1 then
  		'アート'
  	elsif project.event == 1 then
  		'イベント'
  	elsif project.product == 1 then
  		'プロダクト'
  	elsif project.app == 1 then
  		'アプリ'
  	elsif project.food == 1 then
  		'フード'
  	elsif project.game == 1 then
  		'ゲーム'
  	elsif project.global == 1 then
  		'グローバル'
  	elsif project.fashion == 1 then
  		'ファッション'
  	elsif project.movie == 1 then
  		'ムービー'
  	elsif project.book == 1 then
  		'本'
  	end
  end
end
