class NoticesController < ApplicationController
  before_action :set_notice, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  before_action only: [:new, :create, :edit, :update, :destroy] do
    authorize_request([ "admin"])
  end




  # GET /notices or /notices.json
  def index
    @notices = Notice.all
  end

  # GET /notices/1 or /notices/1.json
  def show
    @comments = @notice.comments
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices or /notices.json
  def create
    @notice = Notice.new(notice_params)
    @notice.user = current_user

    respond_to do |format|
      if @notice.save
        format.html { redirect_to @notice, notice: "Notice was successfully created." }
        format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1 or /notices/1.json
  def update
    respond_to do |format|
      if @notice.update(notice_params)
        format.html { redirect_to @notice, notice: "Notice was successfully updated." }
        format.json { render :show, status: :ok, location: @notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1 or /notices/1.json
  def destroy
    @notice.destroy!

    respond_to do |format|
      format.html { redirect_to notices_path, status: :see_other, notice: "Notice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.expect(notice: [ :image, :title, :description, :user_id ])
    end
end
