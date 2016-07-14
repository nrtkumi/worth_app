class TopController < ApplicationController
  def home
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
    @new = Project.all.order("created_at DESC").limit(4)
    @pick_up = Project.order("RANDOM()").limit(4)
  end

  def search
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
  end
end
