class TagsController < ApplicationController
    before_action :set_project, only: %i[ index new create ]
    before_action :set_tag, only: %i[ edit update destroy ]

    def index
        @tags = @project.tags
    end

    def new
        @tag = @project.tags.build
    end

    def create
        @tag = @project.tags.build(tag_params)
        if @tag.save
            redirect_to project_tags_path(@project)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @tag.update(tag_params)
            redirect_to project_tags_path(@tag.project)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @tag.destroy
        redirect_to project_tags_path(@tag.project)
    end

    private

    def set_project
        @project = Current.user.projects.find(params[:project_id])
    end

    def set_tag
        @tag = Tag.joins(project: :memberships)
            .where(memberships: { user: Current.user })
            .find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name, :color)
    end
end
