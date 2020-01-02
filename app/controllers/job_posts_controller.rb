class JobPostsController < ApplicationController

  def index
    @job_posts = JobPost.all.order("created_at DESC")
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = JobPost.new(job_post_params)

    if @job_post.save
      redirect_to @job_post
    else
      render 'new'
    end
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def update
    @job_post = JobPost.find(params[:id])

    if @job_post.update(job_post_params)
      redirect_to @job_post
    else
      render 'edit'
    end
  end

  def edit
    @job_post = JobPost.find(params[:id])
  end

  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    redirect_to job_posts_path
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :content)
  end
end
