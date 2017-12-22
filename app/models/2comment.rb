class CommentsController < ApplicationController  
  before_action :authenticate_profile!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_profile.id, body,rating)
    if commentable_type == "How"
      @how = commentable
    end
    @new_comment = Comment.build_from(commentable, current_profile.id, "",nil)

    respond_to do |format|
      if @comment.save
        make_child_comment
        format.js
        format.html  { redirect_to request.referer || root_path, :notice => 'Comment was successfully added.'  }
      else
        format.html  { render :action => "new" }
      end
    end
  end


  def update
    @comment.update(comment_params)
    respond_to do |format|
      format.html { redirect_to request.referer || root_path, notice: 'Comment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def show


    if @comments.blank?
      @avg_comment = 0
    else
      @avg_comment = @comments.average(:rating).round(2)
end
    
  end




  def destroy

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referer || root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :rating, :how_id )
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

      def set_comment
      @comment = Comment.find(params[:id])
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
