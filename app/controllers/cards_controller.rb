class CardsController < ApplicationController
    before_action :set_project, only: %i[ index new create ]
    before_action :set_card, only: %i[ show edit update destroy ]

    def index
        @cards = @project.cards
        @sprints = @project.sprints
        @unassigned_cards = @project.cards.where(sprint_id: nil, card_type: "card")
        @bugs = @project.cards.where(card_type: "bug")
    end

    def show
    end

    def new
        @card = @project.cards.build
        @sprints = @project.sprints
        @tags = @project.tags
    end

    def create
        @card = @project.cards.build(card_params)
        if @card.save
            redirect_to project_cards_path(@project)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
      @sprints = @card.project.sprints
      @tags = @card.project.tags
    end

    def update
        if @card.update(card_params)
            redirect_to project_cards_path(@card.project)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @card.destroy
        redirect_to project_cards_path(@card.project)
    end

    def set_project
        @project = Current.user.projects.find(params[:project_id])
    end

    def set_card
        @card = Card.joins(project: :memberships)
            .where(memberships: { user: Current.user })
            .find(params[:id])
    end

    def card_params
        params.require(:card).permit(:title, :description, :color, :priority, :card_type, :status, :sprint_id, tag_ids: [])
    end
end
