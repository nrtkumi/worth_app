module ProjectsHelper
	def category_intro(res)
  		case res
  			when 'ビジネス' then
  				'ビジネスって感じよ'
  			when '社会貢献' then
  				'ボランティアとか'
  			when '音楽' then
  				'Hey!! Mr.Music!!'
  			when 'アート' then
  				'絵を描こう'
  			when 'イベント' then
  				'わっしょい、祭りじゃ'
  			when 'プロダクト' then
  				'おおお？'
  			when 'アプリ' then
  				'3コンボ'
  			when 'フード' then
  				'おいひいでっす'
  			when 'ゲーム' then
  				'ナナシスは神'
  			when 'グローバル' then
  				'はろー、しぇいしぇい'
  			when 'ファッション' then
  				'オオォォォォかわいい'
  			when 'ムービー' then
  				'貞子とかね'
  			when '本' then
  				'小説はいいぞ'
  			else
  				''
  		end
  	end

		def project_detail(project)
			Project.find(project)
		end
end
