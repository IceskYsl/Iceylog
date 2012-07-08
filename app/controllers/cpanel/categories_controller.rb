class Cpanel::CategoriesController < Cpanel::ApplicationController
  
  def index
    @categories = Category.all

  end
  
  def show
     @category = Category.find(params[:id])

   end
   
   def merge
     if request.post?
       source_category_id = params[:source_category_id]       
       target_category_id = params[:target_category_id]
       Category.merge(target_category_id,source_category_id)
       redirect_to(cpanel_categories_path, :notice => 'category was successfully merged.')
     end
   end

   def new
     @category = Category.new
   end

   def edit
     @category = Category.find(params[:id])
   end

   def create
     @category = Category.new(params[:category])

     if @category.save
       redirect_to(cpanel_categories_path, :notice => 'category was successfully created.')
     else
       render :action => "new"
     end
   end

   def update
     @category = Category.find(params[:id])

     if @category.update_attributes(params[:category])
       redirect_to(cpanel_categories_path, :notice => 'category was successfully updated.')
     else
       render :action => "edit"
     end
   end

   def destroy
     @category = Category.find(params[:id])
     @category.destroy

     redirect_to(cpanel_categories_path)
   end

  
  
end
