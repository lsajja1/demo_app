class BlogsController < ApplicationController
  def index
  	@user = User.find(params[:user_id])
  	@blogs =@user.blogs.all  	
	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blogs }      
    end
  end

  def show
  	@user = User.find(params[:user_id])
  	@blog = @user.blogs.find(params[:id])

  	if(@blog !=nil )          
       respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @blog }   
          format.js 
        end  
     else
        format.html {redirect_to user_blogs_url}
    end
  end

  def edit
  	@user = User.find(params[:user_id])
  	@blog = @user.blogs.find(params[:id])
  end

  def create
	@user = User.find(params[:user_id])
	@blog = @user.blogs.build(params[:blog])		
	if @blog.save
		 redirect_to user_blogs_url, notice: 'Blog was successfully created.'
	  else
	     render action: "new"
	end	
  end

  def update
  	@user = User.find(params[:user_id])
  	@blog = @user.blogs.find(params[:id])

  	if @blog.update_attributes(params[:blog])
  		redirect_to user_blog_url , notice: 'Blog was successfully updated.'
  	else
  		render action: "edit" 
  	end
  end

  def new
  	@user = User.find(params[:user_id])
  	@blog = Blog.new
  end

  def destroy
  end
end
