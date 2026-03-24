class SprintsController < ApplicationController
    before_action :set_project, only: %i[ index new create ]
    before_action :set_sprint, only: %i[ show edit update destroy]

    def index
        @sprints = @project.sprints
    end

    def show
    end

    def new
        @sprint = @project.sprints.build
    end

    def create
        @sprint = @project.sprints.build(sprint_params)
        if @sprint.save
            redirect_to project_cards_path(@sprint.project)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @sprint.update(sprint_params)
            redirect_to project_card_path(@sprint.project)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @sprint.destroy
        redirect_to project_card_path(@sprint.project)
    end

    private

    def set_project
        @project = Current.user.projects.find(params[:project_id])
    end

    def set_sprint
        @sprint = Sprint.joins(project: :memberships)
            .where(memberships: { user: Current.user })
            .find(params[:id])
    end

    def sprint_params
        params.require(:sprint).permit(:name, :color, :start_date, :end_date)
    end
end
