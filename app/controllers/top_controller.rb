class TopController < ApplicationController
  def home
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
    @new = Project.all.order("created_at DESC").limit(4)
    @pick_up = Project.order("RANDOM()").limit(4)
  end

  def search
    @options = ["ビジネス", "社会貢献", "音楽", "アート", "イベント", "プロダクト", "アプリ", "ゲーム", "フード", "グローバル", "ファッション", "ムービー", "本"]
  end

  def not_found
    raise ActionController::RoutingError,
      "No route matches #{request.path.inspect}"
  end

  def bad_request
    raise ActionController::ParameterMissing, ""
  end

  def internal_server_error
    raise Exception
  end
end
