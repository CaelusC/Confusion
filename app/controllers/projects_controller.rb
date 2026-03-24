class ProjectsController < ApplicationController
    before_action :set_project, only: %i[ show edit update destroy ]
    def index
        @projects = Current.user.projects
    end
    def show
        redirect_to project_cards_path(@project)
    end
    def new
        @project = Project.new
    end
    def create
        @project = Project.new(project_params)
        if @project.save
            @project.memberships.create!(user: Current.user, role: :owner)
            redirect_to @project
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
    end
    def update
        if @project.update(project_params)
            redirect_to @project
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @project.destroy
        redirect_to projects_path
    end

    def set_project
        @project = Current.user.projects.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :color)
    end
end
