class CommentsController < ApplicationController  
  before_action :authenticate_profile!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_profile.id, body, rating)

    respond_to do |format|
      if @comment.save
        @new_comment    = Comment.build_from(@comment.commentable, current_profile.id, "",nil)
        make_child_comment
         format.html  { redirect_to request.referer || root_path, :notice => 'Comment was successfully added.'  }
         format.js
      else
        format.html  { render :action => "new" }
      end
    end
  end


  def destroy

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referer || root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def update
    @comment.update(comment_params)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path, notice: 'Comment was successfully updated.' }
      format.json { respond_with_bip(@comment) }
    end
  end



  #Redirect to previous page after sign in

   def store_location
    if(request.path != "/profiles/sign_in" &&
      request.path != "/profiles/sign_up" &&
      request.path != "/profiles/password/new" &&
      request.path != "/profiles/password/edit" &&
      request.path != "/profiles/confirmation" &&
      request.path != "/uprofiles/sign_out" &&
      !request.xhr? && !current_profile) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end
  def after_sign_in_path_for(resource)
    previous_path = session[:previous_url]
    session[:previous_url] = nil
    previous_path || root_path
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
  end

  def set_comment
  @comment = Comment.find(params[:id])
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

    def rating
    comment_params[:rating]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end

end  