class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if file = params[:file]
      @resume.file= "#{@resume.id}.jpg"
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
    @resume = Resume.find(params[:id])
  end

  def show
    @resume = Resume.find(params[:id])
    if @resume.marry == true
      @marry = "あり"
    else
      @marry = "なし"
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to root_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to root_path,notice: "#{@resume.name}を削除しました"
  end

  private

  def resume_params
    params.require(:resume).permit(:name,:age,:gender,:birthday,:promotion,:marry,:file)
  end
end
