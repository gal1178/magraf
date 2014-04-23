# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  #before_filter :check_auth
  #before_filter :check_role

  def index
    @users=User.order(:id).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    @user.role = 0
    if @user.save
      redirect_to users_path, :notice => "Регистрация прошла успешно!"
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Данные об пользователе были обновлены' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def check_role
    unless current_user.admin?
      redirect_to patients_path, :notice => "Только администраторы могут просматривать список пользователей"
    end
  end

end
