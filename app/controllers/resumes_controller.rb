class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if file = params[:file]
      @resume.file = "#{@resume.id}.jpg"
      File.binwrite("public/#{@resume.file}",file.read)
    end

    if @resume.save
      redirect_to root_path, notice: '投稿に成功しました'
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def show
    if @resume.marry == true
      @marry = "あり"
    else
      @marry = "なし"
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to root_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to root_path,notice: "#{@resume.name}を削除しました"
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:name,:age,:gender,:birthday,:promotion,:marry,:file)
  end
end
