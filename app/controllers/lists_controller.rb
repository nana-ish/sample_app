class ListsController < ApplicationController
  def new
      # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
     @list = List.new
  end

  def create
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if@list.save
    # 4. トップ画面へリダイレクト
    redirect_to list_path(list.id)
    else
      render:new
    end
  end

  def index
    @lists=List.all
  end

  def show
    #listをインスタンス変数とし、Viewで見れるようにする
    @list=List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def  destroy
   list = List.find(params[:id])  # データ（レコード）を1件取得、viewで見せる必要はないから＠はつかない
   list.destroy #データを削除
   redirect_to'/lists'#投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
  params.require(:list).permit(:title, :body)
  end
end
