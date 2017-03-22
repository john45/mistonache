class AnnouncementsController < ApplicationController

  before_action :put_announcements, only: [:index, :show]

  def index
  end

  def show
    @announcement = Announcement.find(params[:id])
    @announcement.update_attribute(:visits, @announcement.visits + 1)
  end

  def go_announcements
    @announcements = Announcement.go_feed.paginate(page: params[:page], per_page: 3)
  end

  def visits
    announcement = Announcement.find(params[:id])
    announcement.update_attribute(:visits, announcement.visits + 1)
  end

  private

  def put_announcements
    @announcements = Announcement.announcements_feed.paginate(page: params[:page], per_page: 3)
  end
end
