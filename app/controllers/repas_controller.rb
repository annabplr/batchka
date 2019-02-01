class RepasController < ApplicationController

  before_action :set_repa, only: [:show, :update, :destroy]

  def index
    @menu = Menu.find(params[:menu_id])
    @ingredients = @menu.ingredients
    shop_magbio
    shop_superm
    shop_petitcomm
    shop_marché
    shop_internet
    shop_none
  end

  def show


  end

  def edit
  end

  def update
  end

  def destroy
    @repa.destroy
  end



  private


  def set_repa
    @repa = Repa.find(params[:id])
  end

   def shop_magbio
    @shopmagbio = @ingredients.select{|ingredient| ingredient.shop == "Magasin Bio" }.sort_by { |a| a.instock ? 1 : 0 }
  end

   def shop_superm
    @shopsuperm = @ingredients.select{|ingredient| ingredient.shop == "Supermarché" }.sort_by { |a| a.instock ? 1 : 0 }
  end

   def shop_petitcomm
    @shoppetitcomm = @ingredients.select{|ingredient| ingredient.shop == "Petit Commerce" }.sort_by { |a| a.instock ? 1 : 0 }
  end

   def shop_marché
    @shopmarché = @ingredients.select{|ingredient| ingredient.shop == "Marché" }.sort_by { |a| a.instock ? 1 : 0 }
  end

   def shop_internet
    @shopinternet = @ingredients.select{|ingredient| ingredient.shop == "Internet" }.sort_by { |a| a.instock ? 1 : 0 }
  end

   def shop_none
    @shopnone = @ingredients.select{|ingredient| ingredient.shop == nil || ingredient.shop == "" }.sort_by { |a| a.instock ? 1 : 0 }
  end
end
