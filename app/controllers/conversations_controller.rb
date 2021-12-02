class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Conversation.find_by!(developer: developer, business: current_user.business)
    authorize @conversation
  end

  private

  def developer
    Developer.find(params[:developer_id])
  end
end