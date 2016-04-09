class TopController < ApplicationController
  def home
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
  end
end
