class UpFilesController < ApplicationController
  def index
    @up_files = UpFile.all
  end

  def new
    @up_file = UpFile.new
  end

  def create
    @up_file = UpFile.new(up_file_params)
    if @up_file.save
      redirect_to up_file_path(@up_file, attention: true), notice: '保存したのだ'
    else
      render :new
    end
  end

  def show
    @up_file = UpFile.find(params[:id])
    @attention = params[:attention].present?
  end

  def download
    @up_file = UpFile.find(params[:id])
    unless @up_file.authenticate(params[:password])
      redirect_to up_file_path(@up_file), alert: 'パスワードが一致しませんでした'
    end
  end

  private def up_file_params
    params.require(:up_file).permit(:name, :password, :password_confirmation, files: [])
  end
end
