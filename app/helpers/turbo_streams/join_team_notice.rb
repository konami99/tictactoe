module TurboStreams::JoinTeamNoticeHelper
  def join_team_notice
    turbo_stream_action_tag :join_team_notice
  end
  
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::JoinTeamNoticeHelper)
